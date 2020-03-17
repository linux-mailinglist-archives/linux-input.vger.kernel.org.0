Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8FD3318918F
	for <lists+linux-input@lfdr.de>; Tue, 17 Mar 2020 23:44:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726564AbgCQWoR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Mar 2020 18:44:17 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:36467 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726476AbgCQWoR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Mar 2020 18:44:17 -0400
Received: by mail-lf1-f65.google.com with SMTP id s1so18671774lfd.3;
        Tue, 17 Mar 2020 15:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Fu8GVUxLvjII7VrARYhkhRDvf4FyhjWv5GYDkk8Hc2Q=;
        b=tCwPcOhNkJfxpRz9k8ZAytkBGG4DO7ZLX/qqgCUGyrNq84/50QixpWGB4HPynpbniH
         GZXmKLrallMFiUdR9tsxWVmnIKmwxyfcS+onBghreUU+a6dphmmaRdYzdOvJcCwDjmOc
         ZERc3NcHfSU9rRztTHXrA0tgi8To99sRMYsKzs3C3sTJ1eghvuZlQakewWE3feAFDOch
         RhsqBvll3sZHvzyV1qfHcsJwAyYQhrE8rLQxjzZtqUemaC7M0Nbov0Y070Kxdx2N/hDZ
         QC5te/+1PsLAdwiTPRm+ORNzmnQBIVIziJAIhlZRYDcMof8Uit+1kJjk0vYLu6HrphYT
         9sSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Fu8GVUxLvjII7VrARYhkhRDvf4FyhjWv5GYDkk8Hc2Q=;
        b=t4sGR4sAkAOqzAKvvK8YyX+Pjab52zpImt1zG04tlL1wk0SrjVHCUlYTN4Uu/AjSJu
         F7Q/KTLXlwmamHursL9nCLKAk28R6TM86NSyzk6qO8zo6K313kjxtyjIiQW2ecSiQ5w8
         OXTOa95JvPjciZ3kvDr9b3//p/lCc+zN45aBel2HyqmjO3NAjOhaXsBrQG8l51XsvoLA
         5jRCGqf1/jvmOTsoB9SrmGco69Z8KYPxPHeXG1YR4F1c3bSk0OYMQOuTVWmvFGwKnDqD
         /cthdlLZhqELG4Y447fDC9rsTltVPt1o507bhnJWRsIHoR/3URhplgguszlEyze+t6bn
         oMWA==
X-Gm-Message-State: ANhLgQ1LJfqYnNixXb0hsqKr0PKUfeKNZkfC33z6L4Ftr66wnyAx9fJ5
        r2IkskPeyZNROjhe537XUpA=
X-Google-Smtp-Source: ADFU+vsn/MKcM/DMMmPpn3eyTNYWAh5rDvjAk45IPuY5FAxzXZpIr2+xJuxntCO4DHPumsAfYRs7Bw==
X-Received: by 2002:ac2:41c2:: with SMTP id d2mr969136lfi.164.1584485054337;
        Tue, 17 Mar 2020 15:44:14 -0700 (PDT)
Received: from [192.168.2.145] (94-29-39-224.dynamic.spd-mgts.ru. [94.29.39.224])
        by smtp.googlemail.com with ESMTPSA id z12sm3383903lfe.51.2020.03.17.15.44.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2020 15:44:13 -0700 (PDT)
Subject: Re: [PATCH v7 03/48] Input: atmel_mxt_ts - only read messages in
 mxt_acquire_irq() when necessary
To:     Jiada Wang <jiada_wang@mentor.com>, jikos@kernel.org,
        benjamin.tissoires@redhat.com, rydberg@bitmath.org,
        dmitry.torokhov@gmail.com, nick@shmanahar.org, bsz@semihalf.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        erosca@de.adit-jv.com, Andrew_Gabbasov@mentor.com
References: <20200212084218.32344-1-jiada_wang@mentor.com>
 <20200212084218.32344-4-jiada_wang@mentor.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <8ea1244b-f045-df34-b6b2-2b812ab6dee4@gmail.com>
Date:   Wed, 18 Mar 2020 01:44:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200212084218.32344-4-jiada_wang@mentor.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

12.02.2020 11:41, Jiada Wang пишет:
> From: Nick Dyer <nick.dyer@itdev.co.uk>
> 
> The workaround of reading all messages until an invalid is received is a
> way of forcing the CHG line high, which means that when using
> edge-triggered interrupts the interrupt can be acquired.
> 
> With level-triggered interrupts the workaround is unnecessary.
> 
> Also, most recent maXTouch chips have a feature called RETRIGEN which, when
> enabled, reasserts the interrupt line every cycle if there are messages
> waiting. This also makes the workaround unnecessary.
> 
> Note: the RETRIGEN feature is only in some firmware versions/chips, it's
> not valid simply to enable the bit.

...
> +static int mxt_check_retrigen(struct mxt_data *data)
> +{
> +	struct i2c_client *client = data->client;
> +	int error;
> +	int val;
> +
> +	data->use_retrigen_workaround = false;
> +
> +	if (irq_get_trigger_type(data->irq) & IRQF_TRIGGER_LOW)
> +		return 0;
> +
> +	if (data->T18_address) {
> +		error = __mxt_read_reg(client,
> +				       data->T18_address + MXT_COMMS_CTRL,
> +				       1, &val);
> +		if (error)
> +			return error;
> +
> +		if (val & MXT_COMMS_RETRIGEN)
> +			return 0;
> +	}
> +
> +	dev_warn(&client->dev, "Enabling RETRIGEN workaround\n");
> +	data->use_retrigen_workaround = true;
> +	return 0;
> +}

Hello Jiada,

I'm seeing "Enabling RETRIGEN workaround" message with the following
device-tree entry:

touchscreen@4c {
	compatible = "atmel,maxtouch";
	reg = <0x4c>;

	interrupt-parent = <&gpio>;
	interrupts = <TEGRA_GPIO(V, 6) IRQ_TYPE_LEVEL_LOW>;

	reset-gpios = <&gpio TEGRA_GPIO(Q, 7) GPIO_ACTIVE_HIGH>;
};

This happens because data->irq is NULL. Please fix it, thanks in advance.
