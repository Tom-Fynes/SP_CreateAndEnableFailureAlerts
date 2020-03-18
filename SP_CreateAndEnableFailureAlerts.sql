if exists (select * from sys.objects as o inner join sys.schemas as s on o.schema_id = s.schema_id where o.name = 'CreateAndEnableFailureAlerts' and s.name = 'dbo') begin
	execute sp_executesql N'drop procedure [dbo].[CreateAndEnableFailureAlerts];';
end
go

create procedure dbo.CreateAndEnableFailureAlerts 
/****************************************************************************************************************************************************************																														               
	Created By:		Thomas Fynes (www.TheunconventionalDBA.com)																															   
	Created On:		Aug 2019																															       
	Description:	
                Create agent alerts if not exists, can also add alerts to an operator and/or update agent jobs.

    Example calls:
            Exec [dob].[EnableAgentFailureAlerts] -- checks and creates alert only
            
            Exec [dbo].[EnableAgentFailureAlerts] @OpName ='TestOp' -- checks and creates alert and adds alerts to the operator listed

            Exec [dbo].[EnableAgentFailureAlerts] @OpName ='TestOp' -- checks and creates alert and adds alerts to the operator listed

            Exec [dbo].[EnableAgentFailureAlerts] @OpName ='TestOp', @UpdateJobs = 1 -- checks and creates alerts and adds alerts if not exists to the operator listed. 
                                                                                            This will also update all agent jobs to use this operator

            Exec [dbo].[EnableAgentFailureAlerts] @OpName ='TestOp', @UpdateJobs = 1, @JobName = 'DBA' -- checks and creates alerts and adds alerts if not exists to the operator listed. 
                                                                                            This will also update agent jobs either with this name for using a part match 'DBAHub %'

****************************************************************************************************************************************************************/
    @OpName nVarchar(150) = Null, -- if null just creates the alerts if not exist
    @UpdateJobs bit = 0, -- if 0 does not update the jobs, if 1 it does! 
    @UpdateJobName nVarchar(150) = NULL -- job name control
as

set transaction isolation level read committed; -- Set correct transaction settings.
set nocount on;


    Declare @JobName nVarchar(150) -- Dynmaic Var

/**********************************************
    Create Alerts if not exists
**********************************************/

if (select count (*) from msdb.dbo.sysalerts where name = N'Severity 016') < 1  begin
    EXEC msdb.dbo.sp_add_alert @name=N'Severity 016',
        @message_id=0,
        @severity=16,
        @enabled=1,
        @delay_between_responses=60,
        @include_event_description_in=1,
        @job_id=N'00000000-0000-0000-0000-000000000000';

    print 'Severity 016 has been created'
End

if (select count (*) from msdb.dbo.sysalerts where name = N'Severity 017') < 1  begin
    EXEC msdb.dbo.sp_add_alert @name=N'Severity 017',
        @message_id=0,
        @severity=17,
        @enabled=1,
        @delay_between_responses=60,
        @include_event_description_in=1,
        @job_id=N'00000000-0000-0000-0000-000000000000';
    
    print 'Severity 017 has been created'
END

if (select count (*) from msdb.dbo.sysalerts where name = N'Severity 018') < 1  begin
    EXEC msdb.dbo.sp_add_alert @name=N'Severity 018',
        @message_id=0,
        @severity=18,
        @enabled=1,
        @delay_between_responses=60,
        @include_event_description_in=1,
        @job_id=N'00000000-0000-0000-0000-000000000000';

        print 'Severity 018 has been created'
END

if (select count (*) from msdb.dbo.sysalerts where name = N'Severity 019') < 1  begin
    EXEC msdb.dbo.sp_add_alert @name=N'Severity 019',
        @message_id=0,
        @severity=19,
        @enabled=1,
        @delay_between_responses=60,
        @include_event_description_in=1,
        @job_id=N'00000000-0000-0000-0000-000000000000';

    print 'Severity 018 has been created'
END

if (select count (*) from msdb.dbo.sysalerts where name = N'Severity 020') < 1  begin
    EXEC msdb.dbo.sp_add_alert @name=N'Severity 020',
        @message_id=0,
        @severity=20,
        @enabled=1,
        @delay_between_responses=60,
        @include_event_description_in=1,
        @job_id=N'00000000-0000-0000-0000-000000000000';

    print 'Severity 020 has been created'
END

if (select count (*) from msdb.dbo.sysalerts where name = N'Severity 021') < 1  begin
    EXEC msdb.dbo.sp_add_alert @name=N'Severity 021',
        @message_id=0,
        @severity=21,
        @enabled=1,
        @delay_between_responses=60,
        @include_event_description_in=1,
        @job_id=N'00000000-0000-0000-0000-000000000000';

    print 'Severity 021 has been created'
END

if (select count (*) from msdb.dbo.sysalerts where name = N'Severity 022') < 1  begin
    EXEC msdb.dbo.sp_add_alert @name=N'Severity 022',
        @message_id=0,
        @severity=22,
        @enabled=1,
        @delay_between_responses=60,
        @include_event_description_in=1,
        @job_id=N'00000000-0000-0000-0000-000000000000';

    print 'Severity 022 has been created'
END

if (select count (*) from msdb.dbo.sysalerts where name = N'Severity 023') < 1  begin
    EXEC msdb.dbo.sp_add_alert @name=N'Severity 023',
        @message_id=0,
        @severity=23,
        @enabled=1,
        @delay_between_responses=60,
        @include_event_description_in=1,
        @job_id=N'00000000-0000-0000-0000-000000000000';

    print 'Severity 023 has been created'
END

if (select count (*) from msdb.dbo.sysalerts where name = N'Severity 024') < 1  begin
    EXEC msdb.dbo.sp_add_alert @name=N'Severity 024',
        @message_id=0,
        @severity=24,
        @enabled=1,
        @delay_between_responses=60,
        @include_event_description_in=1,
        @job_id=N'00000000-0000-0000-0000-000000000000';

    print 'Severity 024 has been created'
END

if (select count (*) from msdb.dbo.sysalerts where name = N'Severity 025') < 1  begin
    EXEC msdb.dbo.sp_add_alert @name=N'Severity 025',
        @message_id=0,
        @severity=25,
        @enabled=1,
        @delay_between_responses=60,
        @include_event_description_in=1,
        @job_id=N'00000000-0000-0000-0000-000000000000';

    print 'Severity 025 has been created'
END

if (select count (*) from msdb.dbo.sysalerts where name = N'Error Number 823') < 1  begin
    EXEC msdb.dbo.sp_add_alert @name=N'Error Number 823',
        @message_id=823,
        @severity=0,
        @enabled=1,
        @delay_between_responses=60,
        @include_event_description_in=1,
        @job_id=N'00000000-0000-0000-0000-000000000000'

    print 'Severity 823 has been created'
END

if (select count (*) from msdb.dbo.sysalerts where name = N'Error Number 824') < 1  begin
    EXEC msdb.dbo.sp_add_alert @name=N'Error Number 824',
        @message_id=824,
        @severity=0,
        @enabled=1,
        @delay_between_responses=60,
        @include_event_description_in=1,
        @job_id=N'00000000-0000-0000-0000-000000000000'

    print 'Severity 824 has been created'
END

if (select count (*) from msdb.dbo.sysalerts where name = N'Error Number 825') < 1  begin
    EXEC msdb.dbo.sp_add_alert @name=N'Error Number 825',
        @message_id=825,
        @severity=0,
        @enabled=1,
        @delay_between_responses=60,
        @include_event_description_in=1,
        @job_id=N'00000000-0000-0000-0000-000000000000'

    print 'Severity 825 has been created'
END

IF (SELECT SERVERPROPERTY ('IsHadrEnabled')) = 1 BEGIN

    if (select count (*) from msdb.dbo.sysalerts where name = N'Hadr - Role Change') < 1  begin
        EXEC msdb.dbo.sp_add_alert @name=N'Hadr - Role Change',
        @message_id=1480,
        @severity=0,
        @enabled=1,
        @delay_between_responses=60,
        @include_event_description_in=1,
        @job_id=N'00000000-0000-0000-0000-000000000000'

        print 'Hadr - Role Change alert has been created'
    End

    if (select count (*) from msdb.dbo.sysalerts where name = N'Hadr Data Movement Suspended') < 1  begin
        EXEC msdb.dbo.sp_add_alert
        @name=N'Hadr - Data Movement Suspended',
        @message_id=35264,
        @severity=0,
        @enabled=1,
        @delay_between_responses=60,
        @include_event_description_in=1,
        @category_name=N'[Uncategorized]',
        @job_id=N'00000000-0000-0000-0000-000000000000'

        print 'Hadr Data Movement Suspended alert has been created'
    END
    
    if (select count (*) from msdb.dbo.sysalerts where name = N'Hadr - Data Movement Resumed') < 1  begin
        EXEC msdb.dbo.sp_add_alert
        @name=N'Hadr - Data Movement Resumed',
        @message_id=35265,
        @severity=0,
        @enabled=1,
        @delay_between_responses=60,
        @include_event_description_in=1,
        @category_name=N'[Uncategorized]',
        @job_id=N'00000000-0000-0000-0000-000000000000'

        print 'Hadr Data Movement Resumed alert has been created'
    END
END

/**********************************************
    Add alerts to agent operator 
**********************************************/

IF (@OpName is not null or @OpName <> '') BEGIN

    IF EXISTS (Select Name from msdb.dbo.sysoperators Where Name = @OpName ) BEGIN

        If (Select Count(*) from msdb.dbo.sysoperators o Inner Join  msdb.dbo.sysnotifications N on N.operator_id = o.id Inner Join msdb.dbo.sysalerts a ON a.id = n.alert_id 
            Where O.name = @OpName And A.severity = 016 ) < 1 Begin

            EXEC msdb.dbo.sp_add_notification @alert_name=N'Severity 016', 
                @operator_name= @OpName, 
                @notification_method = 1;
        END

        If (Select Count(*) from msdb.dbo.sysoperators o Inner Join  msdb.dbo.sysnotifications N on N.operator_id = o.id Inner Join msdb.dbo.sysalerts a ON a.id = n.alert_id 
            Where O.name = @OpName And A.severity = 017 ) < 1 Begin

            EXEC msdb.dbo.sp_add_notification @alert_name=N'Severity 017', 
                @operator_name= @OpName, 
                @notification_method = 1;
        End

        If (Select Count(*) from msdb.dbo.sysoperators o Inner Join  msdb.dbo.sysnotifications N on N.operator_id = o.id Inner Join msdb.dbo.sysalerts a ON a.id = n.alert_id 
            Where O.name = @OpName And A.severity = 018 ) < 1 Begin

            EXEC msdb.dbo.sp_add_notification @alert_name=N'Severity 018', 
                @operator_name= @OpName, 
                @notification_method = 1;
        END

        If (Select Count(*) from msdb.dbo.sysoperators o Inner Join  msdb.dbo.sysnotifications N on N.operator_id = o.id Inner Join msdb.dbo.sysalerts a ON a.id = n.alert_id 
            Where O.name = @OpName And A.severity = 019 ) < 1 Begin

            EXEC msdb.dbo.sp_add_notification @alert_name=N'Severity 019', 
                @operator_name= @OpName, 
                @notification_method = 1;
        END

        If (Select Count(*) from msdb.dbo.sysoperators o Inner Join  msdb.dbo.sysnotifications N on N.operator_id = o.id Inner Join msdb.dbo.sysalerts a ON a.id = n.alert_id 
            Where O.name = @OpName And A.severity = 020 ) < 1 Begin

            EXEC msdb.dbo.sp_add_notification @alert_name=N'Severity 020', 
                @operator_name= @OpName, 
                @notification_method = 1;
        END

        If (Select Count(*) from msdb.dbo.sysoperators o Inner Join  msdb.dbo.sysnotifications N on N.operator_id = o.id Inner Join msdb.dbo.sysalerts a ON a.id = n.alert_id 
            Where O.name = @OpName And A.severity = 021 ) < 1 Begin

            EXEC msdb.dbo.sp_add_notification @alert_name=N'Severity 021', 
                @operator_name= @OpName, 
                @notification_method = 1;
        END

        If (Select Count(*) from msdb.dbo.sysoperators o Inner Join  msdb.dbo.sysnotifications N on N.operator_id = o.id Inner Join msdb.dbo.sysalerts a ON a.id = n.alert_id 
            Where O.name = @OpName And A.severity = 022 ) < 1 Begin

            EXEC msdb.dbo.sp_add_notification @alert_name=N'Severity 022', 
                @operator_name= @OpName, 
                @notification_method = 1;
        END

        If (Select Count(*) from msdb.dbo.sysoperators o Inner Join  msdb.dbo.sysnotifications N on N.operator_id = o.id Inner Join msdb.dbo.sysalerts a ON a.id = n.alert_id 
            Where O.name = @OpName And A.severity = 023 ) < 1 Begin

            EXEC msdb.dbo.sp_add_notification @alert_name=N'Severity 023', 
                @operator_name= @OpName, 
                @notification_method = 1;
        END

        If (Select Count(*) from msdb.dbo.sysoperators o Inner Join  msdb.dbo.sysnotifications N on N.operator_id = o.id Inner Join msdb.dbo.sysalerts a ON a.id = n.alert_id 
            Where O.name = @OpName And A.severity = 024 ) < 1 Begin

            EXEC msdb.dbo.sp_add_notification @alert_name=N'Severity 024', 
                @operator_name= @OpName, 
                @notification_method = 1;
        END

        If (Select Count(*) from msdb.dbo.sysoperators o Inner Join  msdb.dbo.sysnotifications N on N.operator_id = o.id Inner Join msdb.dbo.sysalerts a ON a.id = n.alert_id 
            Where O.name = @OpName And A.severity = 025 ) < 1 Begin

            EXEC msdb.dbo.sp_add_notification @alert_name=N'Severity 025', 
                @operator_name= @OpName, 
                @notification_method = 1;
        END

        If (Select Count(*) from msdb.dbo.sysoperators o Inner Join  msdb.dbo.sysnotifications N on N.operator_id = o.id Inner Join msdb.dbo.sysalerts a ON a.id = n.alert_id 
            Where O.name = @OpName And A.Message_id = 823 ) < 1 Begin

            EXEC msdb.dbo.sp_add_notification @alert_name=N'Error Number 823', 
                @operator_name= @OpName, 
                @notification_method = 1;
        END

        If (Select Count(*) from msdb.dbo.sysoperators o Inner Join  msdb.dbo.sysnotifications N on N.operator_id = o.id Inner Join msdb.dbo.sysalerts a ON a.id = n.alert_id 
            Where O.name = @OpName And A.Message_id = 824 ) < 1 Begin

            EXEC msdb.dbo.sp_add_notification @alert_name=N'Error Number 824', 
                @operator_name= @OpName, 
                @notification_method = 1;
        END

        If (Select Count(*) from msdb.dbo.sysoperators o Inner Join  msdb.dbo.sysnotifications N on N.operator_id = o.id Inner Join msdb.dbo.sysalerts a ON a.id = n.alert_id 
            Where O.name = @OpName And A.Message_id = 825 ) < 1 Begin

            EXEC msdb.dbo.sp_add_notification @alert_name=N'Error Number 825', 
                @operator_name= @OpName, 
                @notification_method = 1;
        END

        If (Select Count(*) from msdb.dbo.sysoperators o Inner Join  msdb.dbo.sysnotifications N on N.operator_id = o.id Inner Join msdb.dbo.sysalerts a ON a.id = n.alert_id 
            Where O.name = @OpName And A.Message_id = 1480 ) < 1 Begin

            EXEC msdb.dbo.sp_add_notification @alert_name = N'Hadr - Role Change', 
                @operator_name= @OpName, 
                @notification_method = 1;
        END       

        If (Select Count(*) from msdb.dbo.sysoperators o Inner Join  msdb.dbo.sysnotifications N on N.operator_id = o.id Inner Join msdb.dbo.sysalerts a ON a.id = n.alert_id 
            Where O.name = @OpName And A.Message_id = 35264 ) < 1 Begin

            EXEC msdb.dbo.sp_add_notification @alert_name = N'Hadr - Data Movement Suspended', 
                @operator_name= @OpName, 
                @notification_method = 1;
        END  
        
        If (Select Count(*) from msdb.dbo.sysoperators o Inner Join  msdb.dbo.sysnotifications N on N.operator_id = o.id Inner Join msdb.dbo.sysalerts a ON a.id = n.alert_id 
            Where O.name = @OpName And A.Message_id = 35265 ) < 1 Begin

            EXEC msdb.dbo.sp_add_notification @alert_name = N'Hadr - Data Movement Resumed', 
                @operator_name= @OpName, 
                @notification_method = 1;
        END 
    Else 
        raiserror('Operator does not exist',16,1)
END

/*********************************************************************
    Set the notify mail operator setting for SQL Server Agent Jobs.
*********************************************************************/

IF (@UpdateJobs = 1 and @OpName is not null) Begin

    If (@UpdateJobName is NULL) 
	Begin

        declare JobListAll cursor for
            select
                name
            from msdb.dbo.sysjobs

        open JobListAll;
        fetch next from JobListAll into @JobName;

        while @@fetch_status = 0
		begin
			execute msdb.dbo.sp_update_job
                @job_name = @JobName,
                @notify_email_operator_name = @OpName,
                @notify_level_email = 2;

            fetch next from JobListAll into @JobName;
        end
		close JobListAll;
		deallocate JobListAll;
    END
    ELSE If (@UpdateJobName is not NULL) Begin
            declare JobList cursor for
            select
                name
            from msdb.dbo.sysjobs
            where name like ''+@UpdateJobName+'%';

        open JobList;
        fetch next from JobList into @JobName;

        while @@fetch_status = 0 begin
            execute msdb.dbo.sp_update_job
                @job_name = @JobName,
                @notify_email_operator_name = @OpName,
                @notify_level_email = 2;
            fetch next from JobList into @JobName;
        end
		close JobList;
		deallocate JobList;
	End

END
    Else IF (@UpdateJobs = 1 and @OpName is null) Begin
        raiserror('Must add operator name to update agent jobs',16,1)
    END
END
