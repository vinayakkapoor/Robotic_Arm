classdef RRRapp_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure           matlab.ui.Figure
        GridLayout         matlab.ui.container.GridLayout
        LeftPanel          matlab.ui.container.Panel
        Theta1SliderLabel  matlab.ui.control.Label
        Theta1Slider       matlab.ui.control.Slider
        Theta3SliderLabel  matlab.ui.control.Label
        Theta3Slider       matlab.ui.control.Slider
        Theta4SliderLabel  matlab.ui.control.Label
        Theta4Slider       matlab.ui.control.Slider
        RightPanel         matlab.ui.container.Panel
        UIAxes             matlab.ui.control.UIAxes
    end

    % Properties that correspond to apps with auto-reflow
    properties (Access = private)
        onePanelWidth = 576;
    end

    
    properties (Access = private)
        theta1=0;
        theta3=0;
        theta4=0;
        L1=1.5;
        L2=1;
        axis_limits;
    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Value changing function: Theta3Slider
        function theta3_changingValues(app, event)
            changingValue_theta3 = event.Value;
            app.axis_limits=app.L1+app.L2;
            app.theta3=changingValue_theta3;
            [T_03, T_04]=returnDH_Param(app.theta1, app.theta3, app.theta4, app.L1, app.L2);            
            plot3(app.UIAxes,[0 T_03(1,4)],[0 T_03(2,4)],[0 T_03(3,4)]);
            hold(app.UIAxes, 'on');
            xlim(app.UIAxes,[-app.axis_limits app.axis_limits]);
            ylim(app.UIAxes,[-app.axis_limits app.axis_limits]);
            zlim(app.UIAxes,[-app.axis_limits app.axis_limits]);
            plot3(app.UIAxes,[T_03(1,4) T_04(1,4)],[T_03(2,4) T_04(2,4)],[T_03(3,4) T_04(3,4)]);
            hold(app.UIAxes, 'off');
        end

        % Value changing function: Theta1Slider
        function theta1_changingValue(app, event)
            changingValue_theta1 = event.Value;
            app.axis_limits=app.L1+app.L2;
            app.theta1=changingValue_theta1;
            [T_03, T_04]=returnDH_Param(app.theta1, app.theta3, app.theta4, app.L1, app.L2);            
            plot3(app.UIAxes,[0 T_03(1,4)],[0 T_03(2,4)],[0 T_03(3,4)]);
            hold(app.UIAxes, 'on');
            xlim(app.UIAxes,[-app.axis_limits app.axis_limits]);
            ylim(app.UIAxes,[-app.axis_limits app.axis_limits]);
            zlim(app.UIAxes,[-app.axis_limits app.axis_limits]);
            plot3(app.UIAxes,[T_03(1,4) T_04(1,4)],[T_03(2,4) T_04(2,4)],[T_03(3,4) T_04(3,4)]);
            hold(app.UIAxes, 'off');
        end

        % Value changing function: Theta4Slider
        function theta4_changingValues(app, event)
            changingValue_theta4 = event.Value;
            app.axis_limits=app.L1+app.L2;
            app.theta4=changingValue_theta4;
            [T_03, T_04]=returnDH_Param(app.theta1, app.theta3, app.theta4, app.L1, app.L2);            
            plot3(app.UIAxes,[0 T_03(1,4)],[0 T_03(2,4)],[0 T_03(3,4)]);
            hold(app.UIAxes, 'on');
            xlim(app.UIAxes,[-app.axis_limits app.axis_limits]);
            ylim(app.UIAxes,[-app.axis_limits app.axis_limits]);
            zlim(app.UIAxes,[-app.axis_limits app.axis_limits]);
            plot3(app.UIAxes,[T_03(1,4) T_04(1,4)],[T_03(2,4) T_04(2,4)],[T_03(3,4) T_04(3,4)]);
            hold(app.UIAxes, 'off');
            
        end

        % Changes arrangement of the app based on UIFigure width
        function updateAppLayout(app, ~)
            currentFigureWidth = app.UIFigure.Position(3);
            if(currentFigureWidth <= app.onePanelWidth)
                % Change to a 2x1 grid
                app.GridLayout.RowHeight = {480, 480};
                app.GridLayout.ColumnWidth = {'1x'};
                app.RightPanel.Layout.Row = 2;
                app.RightPanel.Layout.Column = 1;
            else
                % Change to a 1x2 grid
                app.GridLayout.RowHeight = {'1x'};
                app.GridLayout.ColumnWidth = {233, '1x'};
                app.RightPanel.Layout.Row = 1;
                app.RightPanel.Layout.Column = 2;
            end
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.AutoResizeChildren = 'off';
            app.UIFigure.Position = [100 100 628 480];
            app.UIFigure.Name = 'MATLAB App';
            app.UIFigure.SizeChangedFcn = createCallbackFcn(app, @updateAppLayout, true);

            % Create GridLayout
            app.GridLayout = uigridlayout(app.UIFigure);
            app.GridLayout.ColumnWidth = {233, '1x'};
            app.GridLayout.RowHeight = {'1x'};
            app.GridLayout.ColumnSpacing = 0;
            app.GridLayout.RowSpacing = 0;
            app.GridLayout.Padding = [0 0 0 0];
            app.GridLayout.Scrollable = 'on';

            % Create LeftPanel
            app.LeftPanel = uipanel(app.GridLayout);
            app.LeftPanel.Layout.Row = 1;
            app.LeftPanel.Layout.Column = 1;

            % Create Theta1SliderLabel
            app.Theta1SliderLabel = uilabel(app.LeftPanel);
            app.Theta1SliderLabel.HorizontalAlignment = 'right';
            app.Theta1SliderLabel.Position = [7 401 43 22];
            app.Theta1SliderLabel.Text = 'Theta1';

            % Create Theta1Slider
            app.Theta1Slider = uislider(app.LeftPanel);
            app.Theta1Slider.Limits = [-180 180];
            app.Theta1Slider.ValueChangingFcn = createCallbackFcn(app, @theta1_changingValue, true);
            app.Theta1Slider.Position = [71 410 150 3];

            % Create Theta3SliderLabel
            app.Theta3SliderLabel = uilabel(app.LeftPanel);
            app.Theta3SliderLabel.HorizontalAlignment = 'right';
            app.Theta3SliderLabel.Position = [9 320 43 22];
            app.Theta3SliderLabel.Text = 'Theta3';

            % Create Theta3Slider
            app.Theta3Slider = uislider(app.LeftPanel);
            app.Theta3Slider.Limits = [-180 180];
            app.Theta3Slider.ValueChangingFcn = createCallbackFcn(app, @theta3_changingValues, true);
            app.Theta3Slider.Position = [73 329 150 3];

            % Create Theta4SliderLabel
            app.Theta4SliderLabel = uilabel(app.LeftPanel);
            app.Theta4SliderLabel.HorizontalAlignment = 'right';
            app.Theta4SliderLabel.Position = [5 240 43 22];
            app.Theta4SliderLabel.Text = 'Theta4';

            % Create Theta4Slider
            app.Theta4Slider = uislider(app.LeftPanel);
            app.Theta4Slider.Limits = [-180 180];
            app.Theta4Slider.ValueChangingFcn = createCallbackFcn(app, @theta4_changingValues, true);
            app.Theta4Slider.Position = [69 249 150 3];

            % Create RightPanel
            app.RightPanel = uipanel(app.GridLayout);
            app.RightPanel.Layout.Row = 1;
            app.RightPanel.Layout.Column = 2;

            % Create UIAxes
            app.UIAxes = uiaxes(app.RightPanel);
            title(app.UIAxes, 'Title')
            xlabel(app.UIAxes, 'X')
            ylabel(app.UIAxes, 'Y')
            zlabel(app.UIAxes, 'Z')
            app.UIAxes.Position = [48 157 300 185];

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = RRRapp_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end