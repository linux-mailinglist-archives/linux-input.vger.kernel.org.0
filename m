Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79017298500
	for <lists+linux-input@lfdr.de>; Mon, 26 Oct 2020 00:27:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1420563AbgJYX1z (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 25 Oct 2020 19:27:55 -0400
Received: from mail1.bemta24.messagelabs.com ([67.219.250.3]:15090 "EHLO
        mail1.bemta24.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1420559AbgJYX1y (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 25 Oct 2020 19:27:54 -0400
Received: from [100.112.129.197] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-3.bemta.az-a.us-west-2.aws.symcld.net id AD/FE-32453-6F9069F5; Sun, 25 Oct 2020 23:27:50 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEKsWRWlGSWpSXmKPExsWSLveKXfcb57R
  4gx0rpS0OnTvAbHF40QtGi6/fbrNbvDk+ncnizO2FTBY3P31jtVi95wWzA7vHrIZeNo+ds+6y
  e/zatobFY/nBaUwe7/ddZfP4vEkugC2KNTMvKb8igTXjxf8/jAWnzSumfb3H3MDYqtvFyMkhJ
  PCfUWLLApsuRi4g+wWjxMRnlxlBEsICWRJz3zxgBbFFBNQlpnb0sIEUMQscYZRYNOccI0THbk
  aJz08mM4FUsQloS2zZ8osNxOYVsJU41/oUzGYRUJW4c+47mC0qEC7RcWMHE0SNoMTJmU9Yuhg
  5ODgF7CQWz1EFCTMLWEjMnH+eEcIWl7j1ZD4ThC0vsf3tHGYQW0JAQWLNg2tQdoLEspd3mCcw
  Cs5CMnUWklGzkIyahWTUAkaWVYwWSUWZ6RkluYmZObqGBga6hoZGuoZGlrqGlkZ6iVW6iXqlx
  brlqcUlukBuebFecWVuck6KXl5qySZGYHSlFDQe2MF44/UHvUOMkhxMSqK8qzZOjRfiS8pPqc
  xILM6ILyrNSS0+xKjBwSFw5eCR2YxSLHn5ealKErwsHNPihQSLUtNTK9Iyc4AJAKZUgoNHSYS
  3CSTNW1yQmFucmQ6ROsWoKCXOe5UdKCEAksgozYNrgyWdS4yyUsK8jAwMDEI8BalFuZklqPKv
  GMU5GJWEeS+DjOfJzCuBm/4KaDET0OK2iikgi0sSEVJSDUzrE7M8BeO2hS87yHbs3oVbhX8eP
  eN/Vsx9QDvHkb98lbuDlG19QiT/gYpPE/8cdcqI/3bqvM+cpI2H1liZSiQGtEfdndt0W6LkCN
  eirKIbElke3IUad9a/WlD7ncuIbcGXaGvRm34K2bOc3Wc9ro0McGRomPNfY9uSpNQ35/I9bbW
  +LK7/XfSxMEmApSQiv93+6YNQtU7ZCNnz7hXX5r5LV3H6aLKlJvzSS0mtn7pte++1BCw98Niz
  eoLBlFnyij+M3Jb9ZZpi6LBcMcpQtWfNDHFxL8nPvtvFsmo+Cpksndi9+0Rv8YHrvP+OmRfu7
  7iQJXzVsXrdnvw/QckrJINUKlPuP1j4xNQs8TbzSyWW4oxEQy3mouJEAHJSOs21AwAA
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-17.tower-336.messagelabs.com!1603668468!186865!1
X-Originating-IP: [103.30.234.7]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25389 invoked from network); 25 Oct 2020 23:27:49 -0000
Received: from unknown (HELO lenovo.com) (103.30.234.7)
  by server-17.tower-336.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 25 Oct 2020 23:27:49 -0000
Received: from reswpmail04.lenovo.com (unknown [10.62.32.23])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id 33399D355F137234F837;
        Mon, 26 Oct 2020 07:27:46 +0800 (CST)
Received: from localhost.localdomain (10.46.57.204) by reswpmail04.lenovo.com
 (10.62.32.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2044.4; Sun, 25 Oct
 2020 16:27:42 -0700
Subject: Re: [External] Re: [PATCH v2 3/3] platform/x86: thinkpad_acpi: Add
 support for Lenovo lap sensor
To:     Hans de Goede <hdegoede@redhat.com>
CC:     <njoshi1@lenovo.com>, <dmitry.torokhov@gmail.com>,
        <platform-driver-x86@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <jeff@labundy.com>,
        <anthony.wong@canonical.com>, <hadess@hadess.net>
References: <markpearson@lenovo.com>
 <20201020001556.388099-1-markpearson@lenovo.com>
 <20201020001556.388099-3-markpearson@lenovo.com>
 <89f0bb4e-7edb-9d39-3986-25ed842f0549@redhat.com>
From:   Mark Pearson <markpearson@lenovo.com>
Message-ID: <3ad65617-11f6-ae97-6ef4-6995ec1d935b@lenovo.com>
Date:   Sun, 25 Oct 2020 19:27:40 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <89f0bb4e-7edb-9d39-3986-25ed842f0549@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.46.57.204]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail04.lenovo.com (10.62.32.23)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Hans,


On 25/10/2020 08:03, Hans de Goede wrote:
> Hi,
> 
> On 10/20/20 2:15 AM, Mark Pearson wrote:
>> Use input device event support for notifying userspace of lap mode sensor
>> state changes.
>>
>> Signed-off-by: Mark Pearson <markpearson@lenovo.com>
>> ---
>>   drivers/platform/x86/thinkpad_acpi.c | 75 ++++++++++++++++++++++------
>>   1 file changed, 59 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
>> index 5ddf2775fb06..c20b9902270b 100644
>> --- a/drivers/platform/x86/thinkpad_acpi.c
>> +++ b/drivers/platform/x86/thinkpad_acpi.c
>> @@ -4013,7 +4013,7 @@ static bool hotkey_notify_usrevent(const u32 hkey,
>>   }
>>   
>>   static void thermal_dump_all_sensors(void);
>> -static void proxsensor_refresh(void);
>> +static void proxsensor_refresh(bool palm, bool lap);
>>   
>>   static bool hotkey_notify_6xxx(const u32 hkey,
>>   				 bool *send_acpi_ev,
>> @@ -4081,7 +4081,7 @@ static bool hotkey_notify_6xxx(const u32 hkey,
>>   	case TP_HKEY_EV_PALM_DETECTED:
>>   	case TP_HKEY_EV_PALM_UNDETECTED:
>>   		/* palm detected  - pass on to event handler */
>> -		proxsensor_refresh();
>> +		proxsensor_refresh(true /* palm */, false /* lap */);
>>   		return true;
>>   
>>   	default:
>> @@ -9929,6 +9929,23 @@ static struct ibm_struct dytc_driver_data = {
>>   struct input_dev *tpacpi_sw_dev;
>>   bool has_palmsensor;
>>   bool palmsensor_state;
>> +bool has_lapsensor;
>> +bool lapsensor_state;
> 
> Again, drop the global _state caching, it is not necessary.
Agreed - will do.
> 
>> +
>> +static int lapsensor_get(bool *present, bool *state)
>> +{
>> +	acpi_handle dytc_handle;
>> +	int output;
>> +
>> +	*present = false;
>> +	if (ACPI_FAILURE(acpi_get_handle(hkey_handle, "DYTC", &dytc_handle)))
>> +		return -ENODEV;
>> +	if (!acpi_evalf(dytc_handle, &output, NULL, "dd", DYTC_CMD_GET))
>> +		return -EIO;
>> +	*present = true; /*If we get his far, we have lapmode support*/
>> +	*state = output & BIT(DYTC_GET_LAPMODE_BIT) ? true : false;
>> +	return 0;
>> +}
>>   
>>   static int palmsensor_get(bool *present, bool *state)
>>   {
>> @@ -9945,36 +9962,56 @@ static int palmsensor_get(bool *present, bool *state)
>>   	return 0;
>>   }
>>   
>> -static void proxsensor_refresh(void)
>> +static void proxsensor_refresh(bool palm, bool lap)
> 
> There is zero shared code between the palm ==true and the
> lap ==true paths, please just make this 2 separate functions.
> 
> And then I guess rename the original proxsensor_refresh to
> palmsensor_refresh (note please do this in the 2/3 patch)
> and add a new lapsensor_refresh
Yeah - makes sense. Will do.
> 
>>   {
>>   	bool new_state;
>>   	int err;
>>   
>> -	if (has_palmsensor) {
>> +	if (palm && has_palmsensor) {
>>   		err = palmsensor_get(&has_palmsensor, &new_state);
>> -		if (err)
>> -			return;
> 
> And then you can also keep the if (err) return; construct, which
> is a bit cleaner (more common used) solution vs the !err way
> of handling errors.
Agreed.

> 
>> -		if (new_state != palmsensor_state) {
>> +		if (!err && (new_state != palmsensor_state)) {
>>   			input_report_switch(tpacpi_sw_dev, SW_PALMREST_PROXIMITY, new_state);
>>   			input_sync(tpacpi_sw_dev);
>>   			palmsensor_state = new_state;
>>   		}
>>   	}
>> +
>> +	if (lap && has_lapsensor) {
>> +		err = lapsensor_get(&has_lapsensor, &new_state);
>> +		if (!err && (new_state != lapsensor_state)) {
>> +			input_report_switch(tpacpi_sw_dev, SW_LAP_PROXIMITY, new_state);
>> +			input_sync(tpacpi_sw_dev);
>> +			lapsensor_state = new_state;
> 
> Same as with the other patch there is no need for the
> new_state != lapsensor_state check, the input core does this for you
> turning reporting the same state twice into a no-op.
Agreed

> 
>> +		}
>> +	}
>>   }
>>   
>>   static int tpacpi_proxsensor_init(struct ibm_init_struct *iibm)
>>   {
>> -	int palm_err;
>> +	int palm_err, lap_err, err;
>>   
>> +	/* Make sure globals are set to a sensible initial value */
>> +	has_palmsensor = false;
>> +	has_lapsensor = false;
>>   	palm_err = palmsensor_get(&has_palmsensor, &palmsensor_state);
>> +	lap_err = lapsensor_get(&has_lapsensor, &lapsensor_state);
>> +
>>   	/* If support isn't available (ENODEV) then don't return an error */
>> -	if (palm_err == -ENODEV)
>> +	if ((palm_err == -ENODEV) && (lap_err == -ENODEV))
>>   		return 0;
> 
> return 1, see comment on previous patch.
> 
> ## begin block ###
>> -	/* For all other errors we can flag the failure */
>> +	/* If both sensors error out - return an error */
>> +	if (palm_err && lap_err)
>> +		return palm_err ? palm_err : lap_err;
>> +	/*
>> +	 * If just one sensor not available, we still want the input device,
>> +	 * so just flag it and carry on
>> +	 */
>>   	if (palm_err)
>> -		return palm_err;
>> +		pr_info("Palm sensor returned error %d", palm_err);
>> +	if (lap_err)
>> +		pr_info("Lap sensor returned error %d", lap_err);
> ### end block ###
> 
> thinkpad_acpi will typically error out completely on non -ENODEV
> errors and the palmsensor code from patch 2/3 also does that.
> Note that returning an error from a module/sub-driver's init() is
> fatal (causes the module to not load), so before this change the
> palmsensor_get call failing with a non -ENODEV error was fatal.
> This may seem a bit harsh, but it is how error handling in
> thinkpad_acpi has worked so far, so lets be consistent here.
> 
> Also if now only 1 of the 2 sensors is available you will log
> the -ENODEV error.
> 
> So this whole block should be replaced with something like this:
> 
> 	if (palm_err && palm_err != ENODEV)
> 		return palm_err;
> 
> 	if (lap_err && lap_err != ENODEV)
> 		return lap_err;
> 
Understood - that was my aim and I think I just messed up here.
Thanks

>>   
>> -	if (has_palmsensor) {
>> +	if (has_palmsensor || has_lapsensor) {
>>   		tpacpi_sw_dev = input_allocate_device();
>>   		if (!tpacpi_sw_dev)
>>   			return -ENOMEM;
>> @@ -9990,10 +10027,14 @@ static int tpacpi_proxsensor_init(struct ibm_init_struct *iibm)
>>   			input_set_capability(tpacpi_sw_dev, EV_SW, SW_PALMREST_PROXIMITY);
>>   			input_report_switch(tpacpi_sw_dev, SW_PALMREST_PROXIMITY, palmsensor_state);
>>   		}
>> -		palm_err = input_register_device(tpacpi_sw_dev);
>> -		if (palm_err) {
>> +		if (has_lapsensor) {
>> +			input_set_capability(tpacpi_sw_dev, EV_SW, SW_LAP_PROXIMITY);
>> +			input_report_switch(tpacpi_sw_dev, SW_LAP_PROXIMITY, lapsensor_state);
>> +		}
>> +		err = input_register_device(tpacpi_sw_dev);
>> +		if (err) {
>>   			input_free_device(tpacpi_sw_dev);
>> -			return palm_err;
>> +			return err;
>>   		}
>>   	}
>>   	return 0;
>> @@ -10057,8 +10098,10 @@ static void tpacpi_driver_event(const unsigned int hkey_event)
>>   		mutex_unlock(&kbdlight_mutex);
>>   	}
>>   
>> -	if (hkey_event == TP_HKEY_EV_THM_CSM_COMPLETED)
>> +	if (hkey_event == TP_HKEY_EV_THM_CSM_COMPLETED) {
>>   		dytc_lapmode_refresh();
>> +		proxsensor_refresh(false /* palm */, true /* lap */);
>> +	}
>>   
>>   }
>>   
>>
> 
> Otherwise this looks good to me,
> 
> Regards,
> 
> Hans
> 
Thanks for the review
Mark
