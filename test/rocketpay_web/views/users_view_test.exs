defmodule RocketpayWeb.UsersViewTest do

  use RocketpayWeb.ConnCase, async: true
  import Phoenix.View

  alias Rocketpay.{Account, User}
  alias RocketpayWeb.UsersView

  test "renders create.json" do
    params = %{
      name: "Rafael",
      password: "123456",
      nickname: "rafa",
      email: "rafael@stop.com",
      age: 22
    }

    {:ok, %User{id: user_id, account: %Account{id: account_id}} = user} = Rocketpay.create_user(params)

    response = render(UsersView, "create.json", user: user)

    expected_response = %{
      message: "User created",
      user: %{
        account: %{
          balance: Decimal.new("0.00"),
          id: account_id
        },
        id: user_id,
        name: "Rafael",
        nickname: "rafa"
      }
    }

    assert expected_response == response
  end
end
