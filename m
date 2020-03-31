Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E3C0199938
	for <lists+linux-input@lfdr.de>; Tue, 31 Mar 2020 17:08:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730622AbgCaPIy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 31 Mar 2020 11:08:54 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:46311 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726526AbgCaPIx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 31 Mar 2020 11:08:53 -0400
Received: by mail-lf1-f67.google.com with SMTP id q5so17576250lfb.13;
        Tue, 31 Mar 2020 08:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PwB0D934cQb5SQBA8Gssrx/QqfXAhQTzkTrY8dLc730=;
        b=rEzm2CTKyebjiOFIvL9oF95lC8hpwBApMoUjxpdJMcRMlrMaEnaWxeCHVSvpVYrPPs
         PVOovTtr/8XoluW1Ppmvsg+WxY/TFaftwdn9r/KhsDWVnRv/uP5TMOgBFHQwkW0eR0mr
         YzEhrkhJpRIiVt7ZT2+JaZjYqqhG4uBpgGyeAUeiypfI5SKy6Z/+lPtDlBYdQIpa6MQr
         umknyNjeTo4eprNsgtQ2VxguDGmyKYOULpWwEqHbyTCgBFqSs5NC8uvSjmSqO3cZ+Zb7
         +o111W3VjCH9w7njSZrk8BlgdZnvqqXCkU43mYtqCMQ43gvKlXTr4lCUbOVEEP+nJDta
         BWLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PwB0D934cQb5SQBA8Gssrx/QqfXAhQTzkTrY8dLc730=;
        b=spSxySnQceUyPWdDkEfmW7SYyIFEAE0pEYDw7C1XtRDzuj125lTlv27H2osDznv8ay
         gTDFo9ITzLFCN2y3tPkynt+RQCprz8h/BQ1yjx+3OepPLSpv2QyWxuNv1lwPQaRbSi4n
         FQHboMyC3NgYlEPp2xErFBVGmwqlQVG0Ye66lsWdGDtaSyvW5fT483hfy6tDAbjPVmlS
         aMc9MZU3W4ucqWs4vPsYenAP+f3r1ZVJcmun8SBP5h1KEk2ZNnQVRGAmnpEdvmf+vBLQ
         lDUl9eS4oV6zEDEBUVDJ61VqNMhOk3a0gZ+dQh+otkPfGIUZWeJrqL7oCg5LBFmpMPJP
         Ki3A==
X-Gm-Message-State: AGi0Pua5Kh530Zt5AbizHMCFX5BDV8FrsQ34xVHUKCWGPf/4Ibg2k8ki
        eXVVX9Vmgv1HWCjrhnYzs1Q=
X-Google-Smtp-Source: APiQypLcpmzCn0bFzVZtoCpCWCXnfV+MlTf3dh/XTnKU2d7WgwjElbI9h/sk0kxLr3466BlCKYwHCg==
X-Received: by 2002:a19:c197:: with SMTP id r145mr11841290lff.8.1585667331116;
        Tue, 31 Mar 2020 08:08:51 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id b17sm3100929lfa.15.2020.03.31.08.08.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2020 08:08:50 -0700 (PDT)
Subject: Re: [PATCH v10 52/55] input: touchscreen: atmel_mxt_ts: Added sysfs
 entry for touchscreen status
To:     Jiada Wang <jiada_wang@mentor.com>, nick@shmanahar.org,
        dmitry.torokhov@gmail.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com, bsz@semihalf.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        erosca@de.adit-jv.com, Andrew_Gabbasov@mentor.com
References: <20200331105051.58896-1-jiada_wang@mentor.com>
 <20200331105051.58896-53-jiada_wang@mentor.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <63336277-8ed2-a097-a983-6e8ac48d776e@gmail.com>
Date:   Tue, 31 Mar 2020 18:08:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200331105051.58896-53-jiada_wang@mentor.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

31.03.2020 13:50, Jiada Wang пишет:
...
> +static void mxt_watchdog_work(struct work_struct *work)
> +{
> +	struct mxt_data *data =
> +		container_of(work, struct mxt_data, watchdog_work.work);
> +	u16 info_buf;
> +	int ret;
> +
> +	if (data->suspended || data->in_bootloader ||
> +	    data->mxt_status.intp_triggered)
> +		goto sched_work;

Won't it become a problem if other thread puts device into suspended /
bootloader state in the same time?

> +	ret = __mxt_read_reg(data->client, 0, sizeof(info_buf), &info_buf);
> +
> +	if (ret) {
> +		data->mxt_status.error_count++;
> +		data->mxt_status.dev_status = false;
> +	} else {
> +		data->mxt_status.dev_status = true;
> +	}
> +
> +sched_work:
> +	schedule_delayed_work(&data->watchdog_work,
> +			      msecs_to_jiffies(MXT_WATCHDOG_TIMEOUT));
> +}
...

> @@ -4329,6 +4390,12 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
>  		msleep(MXT_RESET_TIME);
>  	}
>  
> +	if (debug_state) {
> +		INIT_DELAYED_WORK(&data->watchdog_work, mxt_watchdog_work);
> +		schedule_delayed_work(&data->watchdog_work,
> +				      msecs_to_jiffies(MXT_WATCHDOG_TIMEOUT));
> +	}
> +
>  	error = mxt_initialize(data);
>  	if (error)
>  		goto err_free_object;
> @@ -4343,6 +4410,8 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
>  	return 0;
>  
>  err_free_object:
> +	if (debug_state)
> +		cancel_delayed_work_sync(&data->watchdog_work);
>  	mxt_free_input_device(data);
>  	mxt_free_object_table(data);
>  	if (data->reset_gpio) {
> @@ -4367,6 +4436,9 @@ static int mxt_remove(struct i2c_client *client)
>  	mxt_free_input_device(data);
>  	mxt_free_object_table(data);
>  
> +	if (debug_state)
> +		cancel_delayed_work_sync(&data->watchdog_work);

What will happen if debug_state was false during of mxt_probe() and then
the debug_state parameter was changed to true via sysfs?

I think the INIT_DELAYED_WORK() and cancel_delayed_work_sync() should be
invoked unconditionally.

>  	return 0;
>  }
>  
> @@ -4463,3 +4535,7 @@ module_i2c_driver(mxt_driver);
>  MODULE_AUTHOR("Joonyoung Shim <jy0922.shim@samsung.com>");
>  MODULE_DESCRIPTION("Atmel maXTouch Touchscreen driver");
>  MODULE_LICENSE("GPL");
> +
> +module_param(debug_state, bool, 0);
> +MODULE_PARM_DESC(debug_state, "Enable/Disable watchdog work to check device state (default="
> +		 __MODULE_STRING(MXT_DEBUG_STATE) ")");
> 

The "default=..." part of MODULE_PARM_DESC() probably isn't really
useful and could be omitted, don't you think so?
