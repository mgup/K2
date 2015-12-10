# Контроллер для работы с учебными планами.
class Study::PlansController < ApplicationController
  respond_to :html

  load_and_authorize_resource
end
