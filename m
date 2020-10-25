Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B7002984FE
	for <lists+linux-input@lfdr.de>; Mon, 26 Oct 2020 00:26:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1420561AbgJYX0C (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 25 Oct 2020 19:26:02 -0400
Received: from mail1.bemta23.messagelabs.com ([67.219.246.114]:8866 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1420559AbgJYX0C (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 25 Oct 2020 19:26:02 -0400
Received: from [100.112.7.7] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-3.bemta.az-c.us-east-1.aws.symcld.net id 15/CC-08584-789069F5; Sun, 25 Oct 2020 23:25:59 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrAKsWRWlGSWpSXmKPExsWS8eIhr24757R
  4g5WTuC0OnTvAbHF40QtGi6/fbrNbvDk+ncnizO2FTBY3P31jtVi95wWzA7vHrIZeNo+ds+6y
  e/zatobFY/nBaUwe7/ddZfP4vEkugC2KNTMvKb8igTXj0JknbAW/9CumXGpjamC8o97FyMkhJ
  PCfUeLXLIsuRi4g+wWjxIen91lBEsIC2RLzzu8As0UE1CWmdvSwgRQxCxxhlFg05xwjRPduRo
  mjcyRAbDYBbYktW36xgdi8ArYS/2/0M4PYLAKqElPnbgWrFxUIl+i4sYMJokZQ4uTMJywgNqe
  AncSzq/1gy5gFLCRmzj/PCGGLS9x6Mp8JwpaX2P52DthMCQEFiTUPrkHZCRLLXt5hnsAoOAvJ
  2FlIRs1CMmoWklELGFlWMZolFWWmZ5TkJmbm6BoaGOgaGhrpmusamlroJVbpJuuVFuumJhaX6
  BrqJZYX6xVX5ibnpOjlpZZsYgRGVkoB+7wdjB1vPugdYpTkYFIS5V21cWq8EF9SfkplRmJxRn
  xRaU5q8SFGDQ4OgSsHj8xmlGLJy89LVZLgZeGYFi8kWJSanlqRlpkDjH6YUgkOHiUR3iaQNG9
  xQWJucWY6ROoUo6KUOO9VdqCEAEgiozQPrg2WcC4xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BU
  Eua9DDKeJzOvBG76K6DFTECL2yqmgCwuSURISTUwWUjc2vPn7Y7TLRc569YdD5OrLRGNlW5ia
  azSzzv0N/j0HK/6LfxMOrOUirwu9jncXqwvc219ZPjuph0X71ZO4L2cW5W1oOtKsNF+oSebdk
  X8mHZP5OH33zsPFHQ63BU1N5lw2fWtncfLVat2Bha6ne15xWy9jGORtMLbCdJz4iVktcotpQ3
  OegS0C6fq24lGGq7YVPaiQSA7ULhVZu65eQJn957ZM/ty4FSVMyGz90XNvVW67/f5OAXnSZ8+
  JvksnbJh8evHhw+85fsnyVnZtmW2jWV90wMRvc2ODTrGExW5XbK/7fkREmY1qaEuO2PTfcdL/
  bXiYtvvxc/Xv3XSz37HtNT+owE/zKeXV/x5qMRSnJFoqMVcVJwIABsFfVqzAwAA
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-20.tower-416.messagelabs.com!1603668359!639808!1
X-Originating-IP: [104.232.225.13]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22922 invoked from network); 25 Oct 2020 23:25:59 -0000
Received: from unknown (HELO lenovo.com) (104.232.225.13)
  by server-20.tower-416.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 25 Oct 2020 23:25:59 -0000
Received: from reswpmail04.lenovo.com (unknown [10.62.32.23])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id F0E1C2CA8C1526A610BE;
        Sun, 25 Oct 2020 19:25:58 -0400 (EDT)
Received: from localhost.localdomain (10.46.57.204) by reswpmail04.lenovo.com
 (10.62.32.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2044.4; Sun, 25 Oct
 2020 16:25:56 -0700
Subject: Re: [External] Re: [PATCH v2 2/3] platform/x86: thinkpad_acpi: Add
 support for Lenovo palm sensor
To:     Hans de Goede <hdegoede@redhat.com>
CC:     <njoshi1@lenovo.com>, <dmitry.torokhov@gmail.com>,
        <platform-driver-x86@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <jeff@labundy.com>,
        <anthony.wong@canonical.com>, <hadess@hadess.net>
References: <markpearson@lenovo.com>
 <20201020001556.388099-1-markpearson@lenovo.com>
 <20201020001556.388099-2-markpearson@lenovo.com>
 <ac27f71b-c3ce-8d68-cbf6-4c8b43689cf1@redhat.com>
From:   Mark Pearson <markpearson@lenovo.com>
Message-ID: <8dc4378b-dd5b-1360-d4da-c9bc3159c564@lenovo.com>
Date:   Sun, 25 Oct 2020 19:25:54 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <ac27f71b-c3ce-8d68-cbf6-4c8b43689cf1@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.46.57.204]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail04.lenovo.com (10.62.32.23)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Thanks Hans,

On 25/10/2020 08:04, Hans de Goede wrote:
> Hi,
> 
> On 10/20/20 2:15 AM, Mark Pearson wrote:
>> Use input device event support for notifying userspace of palm sensor
>> state changes
>>
>> Signed-off-by: Mark Pearson <markpearson@lenovo.com>
>> ---
>>   drivers/platform/x86/thinkpad_acpi.c | 99 +++++++++++++++++++++++++++-
>>   1 file changed, 97 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
>> index eae3579f106f..5ddf2775fb06 100644
>> --- a/drivers/platform/x86/thinkpad_acpi.c
>> +++ b/drivers/platform/x86/thinkpad_acpi.c
>> @@ -4013,6 +4013,7 @@ static bool hotkey_notify_usrevent(const u32 hkey,
>>   }
>>   
>>   static void thermal_dump_all_sensors(void);
>> +static void proxsensor_refresh(void);
>>   
>>   static bool hotkey_notify_6xxx(const u32 hkey,
>>   				 bool *send_acpi_ev,
>> @@ -4079,8 +4080,8 @@ static bool hotkey_notify_6xxx(const u32 hkey,
>>   
>>   	case TP_HKEY_EV_PALM_DETECTED:
>>   	case TP_HKEY_EV_PALM_UNDETECTED:
>> -		/* palm detected hovering the keyboard, forward to user-space
>> -		 * via netlink for consumption */
>> +		/* palm detected  - pass on to event handler */
>> +		proxsensor_refresh();
>>   		return true;
>>   
>>   	default:
>> @@ -9918,6 +9919,96 @@ static struct ibm_struct dytc_driver_data = {
>>   	.exit = dytc_exit,
>>   };
>>   
>> +/*************************************************************************
>> + * Proximity sensor subdriver
>> + */
>> +
>> +#define PALMSENSOR_PRESENT_BIT 0 /* Determine if psensor present */
>> +#define PALMSENSOR_ON_BIT      1 /* psensor status */
>> +
>> +struct input_dev *tpacpi_sw_dev;
>> +bool has_palmsensor;
>> +bool palmsensor_state;
> 
> There is no need to make palmsensor_state global, see below.
> 
>> +
>> +static int palmsensor_get(bool *present, bool *state)
>> +{
>> +	acpi_handle psensor_handle;
>> +	int output;
>> +
>> +	if (ACPI_FAILURE(acpi_get_handle(hkey_handle, "GPSS", &psensor_handle)))
>> +		return -ENODEV;
>> +	if (!acpi_evalf(psensor_handle, &output, NULL, "d"))
>> +		return -EIO;
>> +
>> +	*present = output & BIT(PALMSENSOR_PRESENT_BIT) ? true : false;
>> +	*state = output & BIT(PALMSENSOR_ON_BIT) ? true : false;
>> +	return 0;
>> +}
>> +
>> +static void proxsensor_refresh(void)
>> +{
>> +	bool new_state;
>> +	int err;
>> +
>> +	if (has_palmsensor) {
>> +		err = palmsensor_get(&has_palmsensor, &new_state);
>> +		if (err)
>> +			return;
>> +		if (new_state != palmsensor_state) {
>> +			input_report_switch(tpacpi_sw_dev, SW_PALMREST_PROXIMITY, new_state);
>> +			input_sync(tpacpi_sw_dev);
>> +			palmsensor_state = new_state;
>> +		}
> 
> There is no need for the whole new_state / orig_state dance here, the input subsys
> will only send events to userspace if anything has actually changed, so you can just
> write the following here:
> 
> 		err = palmsensor_get(&has_palmsensor, &new_state);
> 		if (err)
> 			return;
> 
> 		input_report_switch(tpacpi_sw_dev, SW_PALMREST_PROXIMITY, new_state);
> 		input_sync(tpacpi_sw_dev);
> 
Ah - got it. Thanks!

>> +	}
>> +}
>> +
>> +static int tpacpi_proxsensor_init(struct ibm_init_struct *iibm)
>> +{
>> +	int palm_err;
>> +
>> +	palm_err = palmsensor_get(&has_palmsensor, &palmsensor_state);
>> +	/* If support isn't available (ENODEV) then don't return an error */
>> +	if (palm_err == -ENODEV)
>> +		return 0;
> 
> If you return 1 here, then this new-module will not be added
> to the tpacpi_all_drivers list (which is good since it is non functional)
> and then tpacpi_proxsensor_exit will also be skipped.
Ah - I thought 0 would do that. Agreed and I'll change.
> 
>> +	/* For all other errors we can flag the failure */
>> +	if (palm_err)
>> +		return palm_err;
>> +
>> +	if (has_palmsensor) {
>> +		tpacpi_sw_dev = input_allocate_device();
>> +		if (!tpacpi_sw_dev)
>> +			return -ENOMEM;
>> +		tpacpi_sw_dev->name = "Thinkpad proximity switches";
>> +		tpacpi_sw_dev->phys = TPACPI_DRVR_NAME "/input1";
>> +		tpacpi_sw_dev->id.bustype = BUS_HOST;
>> +		tpacpi_sw_dev->id.vendor = thinkpad_id.vendor;
>> +		tpacpi_sw_dev->id.product = TPACPI_HKEY_INPUT_PRODUCT;
>> +		tpacpi_sw_dev->id.version = TPACPI_HKEY_INPUT_VERSION;
>> +		tpacpi_sw_dev->dev.parent = &tpacpi_pdev->dev;
>> +
>> +		if (has_palmsensor) {
>> +			input_set_capability(tpacpi_sw_dev, EV_SW, SW_PALMREST_PROXIMITY);
>> +			input_report_switch(tpacpi_sw_dev, SW_PALMREST_PROXIMITY, palmsensor_state);
>> +		}
>> +		palm_err = input_register_device(tpacpi_sw_dev);
>> +		if (palm_err) {
>> +			input_free_device(tpacpi_sw_dev);
> 
> Maybe do "tpacpi_sw_dev = NULL" here to avoid leaving a dangling global pointer around ?
Agreed - Will do
> 
>> +			return palm_err;
>> +		}
> 
> 		return 0 here
> 
>> +	}
>> +	return 0;
> 
> And return 1 here, as discussed above.
Ack
> 
> This will ...
> 
>> +}
>> +
>> +static void proxsensor_exit(void)
>> +{
>> +	input_unregister_device(tpacpi_sw_dev);
> 
> Avoid a NULL pointer deref here when there is no palmrest sensor.
> 
>> +	input_free_device(tpacpi_sw_dev);
> 
> The line needs to be deleted, input_free_device() is only for freeing
> devices before they are registered (so in case of some error)
> input_unregister_device() already does a put on the device, so also
> calling input_free_device() here messes up the ref counting.
My bad. Will fix.

> 
>> +}
>> +
>> +static struct ibm_struct proxsensor_driver_data = {
>> +	.name = "proximity-sensor",
>> +	.exit = proxsensor_exit,
>> +};
>>   /****************************************************************************
>>    ****************************************************************************
>>    *
>> @@ -10411,6 +10502,10 @@ static struct ibm_init_struct ibms_init[] __initdata = {
>>   		.init = tpacpi_dytc_init,
>>   		.data = &dytc_driver_data,
>>   	},
>> +	{
>> +		.init = tpacpi_proxsensor_init,
>> +		.data = &proxsensor_driver_data,
>> +	},
>>   };
>>   
>>   static int __init set_ibm_param(const char *val, const struct kernel_param *kp)
>>
> 
> Otherwise this looks good to me.
> 
> Regards,
> 
> Hans
> 
Thanks for the review. I'll get those fixes in ASAP
Mark
