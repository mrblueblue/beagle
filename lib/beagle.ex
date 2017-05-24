defmodule Beagle.Helpers do
  use Hound.Helpers
  @retry_time 500
  @retries 12

  def wait_until_not_visible(element, retries \\ @retries) do
    if retries == 0 do
      {:error, "too many retries"}
    else
      case Hound.Helpers.Page.search_element(:css, element, 0) do
        {:error, _} ->
          {:ok, "Element not found"}
        {:ok, element} ->
          :timer.sleep(@retry_time)
          wait_until_not_visible(element, retries - 1)
      end
    end
  end

  def doubleclick do
    session_id = Hound.current_session_id
    Hound.RequestUtils.make_req(:post, "session/#{session_id}/doubleclick")
  end

  defp get_element({strategy, selector}),
    do: Hound.Helpers.Page.find_element(strategy, selector)

end
