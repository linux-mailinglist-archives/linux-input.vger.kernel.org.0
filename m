Return-Path: <linux-input+bounces-119-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C292E7EF7E4
	for <lists+linux-input@lfdr.de>; Fri, 17 Nov 2023 20:35:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3EC4BB20801
	for <lists+linux-input@lfdr.de>; Fri, 17 Nov 2023 19:35:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5E0643152;
	Fri, 17 Nov 2023 19:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="giXRrElZ"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ED9DD52
	for <linux-input@vger.kernel.org>; Fri, 17 Nov 2023 11:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700249701;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wi+qdvlK9lA0J3Ht9orUPVWVSvkI3cpRi2ROJRWKyPs=;
	b=giXRrElZAwa+V4NdPMciYl7k7GqgXC8BHVnhCqiNCvzjCBTJ0SNB0wfCVUarTcY3uTygwp
	5zjKoGp5SAbIrNcczGEjAlBZNwTiIZgxKj7rqv2FraVnXqUYZ4v5IwSOsoriiH64HJ+m+2
	FApMnL9zeumGkaKAEG4yHzzY6LU65N8=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-213-Z41h-gLeMla0313r8I8zqA-1; Fri, 17 Nov 2023 14:35:00 -0500
X-MC-Unique: Z41h-gLeMla0313r8I8zqA-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-507d208be33so2410185e87.3
        for <linux-input@vger.kernel.org>; Fri, 17 Nov 2023 11:34:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700249698; x=1700854498;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wi+qdvlK9lA0J3Ht9orUPVWVSvkI3cpRi2ROJRWKyPs=;
        b=vgyQgDMwDzgBz5haEW9uEnSt9iPHxPpI80BEBHKaW/JM6+S5x4GweJMO4fuke7gmWd
         Wisd8a+ZHvaSXkHYa0uYFbBl+4KmSOj7HVaYrdi15SqvzyxcX/eFZUyzTW/DQii2h+rG
         DqDBb6MjBm83249FOCrVxpcIpB7V2jE4JhpZyFLYKT5KcxmKGu+s+FN8xHGU2PnQu6Ti
         lhxyyBvZ1oUadj9GmGPPLcBSouNu17x2CfbceKB7zSUQCE1d2QgdWEhK/xLDUl9ZApcZ
         UKQzq+6mbb+GPJ31XltebJP/UAUGMwhWW9ixHwqDTqCc3nEm80dL2aDrEuHkBcaEq5ix
         /+yg==
X-Gm-Message-State: AOJu0YwBfI+qon+Sph7LauwXnHFJ8XcNpDBU8ZKREg2aNjrdI3N6/W9r
	6kdbqVLBnu1vHp0wBKYPYC2AieickIwSDD01vDWFtqbbcrTxx3uDjqrzdeuQM7nOoieAlMGyy4f
	qEs3yAoYE53dM4sLqzqcWJKU=
X-Received: by 2002:a05:6512:485b:b0:503:905:c5a3 with SMTP id ep27-20020a056512485b00b005030905c5a3mr430281lfb.35.1700249698448;
        Fri, 17 Nov 2023 11:34:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFzsULyRTbXLZQkdTGU7702L5M2Y8Ki+4qL/b12jtwPAGy+1Dk8iqD1wyNUJcQbjTncm6a51Q==
X-Received: by 2002:a05:6512:485b:b0:503:905:c5a3 with SMTP id ep27-20020a056512485b00b005030905c5a3mr430264lfb.35.1700249698072;
        Fri, 17 Nov 2023 11:34:58 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id ga23-20020a170906b85700b009dbf75d2c47sm1096269ejb.32.2023.11.17.11.34.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Nov 2023 11:34:57 -0800 (PST)
Message-ID: <0234f3f6-ff90-41a9-bfd4-3c04a612aa02@redhat.com>
Date: Fri, 17 Nov 2023 20:34:56 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] HID: i2c-hid: Fold i2c_hid_execute_reset() into
 i2c_hid_hwreset()
Content-Language: en-US, nl
To: Doug Anderson <dianders@chromium.org>
Cc: Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>, Julian Sax
 <jsbc@gmx.de>, ahormann@gmx.net, Bruno Jesus <bruno.fl.jesus@gmail.com>,
 Dietrich <enaut.w@googlemail.com>, kloxdami@yahoo.com,
 Tim Aldridge <taldridge@mac.com>, Rene Wagner <redhatbugzilla@callerid.de>,
 Federico Ricchiuto <fed.ricchiuto@gmail.com>, linux-input@vger.kernel.org
References: <20231104111743.14668-1-hdegoede@redhat.com>
 <20231104111743.14668-2-hdegoede@redhat.com>
 <CAD=FV=XBoq3ydHcSgKxRBC0f=-jytkcQpwst7BmmFZVtTBqNtQ@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAD=FV=XBoq3ydHcSgKxRBC0f=-jytkcQpwst7BmmFZVtTBqNtQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Douglas,

Thank you for the reviews.

On 11/6/23 19:50, Doug Anderson wrote:
> Hi,
> 
> On Sat, Nov 4, 2023 at 4:17 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> @@ -482,21 +442,49 @@ static int i2c_hid_hwreset(struct i2c_hid *ihid)
>>
>>         ret = i2c_hid_set_power(ihid, I2C_HID_PWR_ON);
>>         if (ret)
>> -               goto out_unlock;
>> +               goto err_unlock;
>>
>> -       ret = i2c_hid_execute_reset(ihid);
>> +       /* Prepare reset command. Command register goes first. */
>> +       *(__le16 *)ihid->cmdbuf = ihid->hdesc.wCommandRegister;
>> +       length += sizeof(__le16);
>> +       /* Next is RESET command itself */
>> +       length += i2c_hid_encode_command(ihid->cmdbuf + length,
>> +                                        I2C_HID_OPCODE_RESET, 0, 0);
>> +
>> +       set_bit(I2C_HID_RESET_PENDING, &ihid->flags);
>> +
>> +       ret = i2c_hid_xfer(ihid, ihid->cmdbuf, length, NULL, 0);
>>         if (ret) {
>>                 dev_err(&ihid->client->dev,
>>                         "failed to reset device: %d\n", ret);
>> -               i2c_hid_set_power(ihid, I2C_HID_PWR_SLEEP);
>> -               goto out_unlock;
>> +               goto err_clear_reset;
>>         }
>>
>> +       if (ihid->quirks & I2C_HID_QUIRK_NO_IRQ_AFTER_RESET) {
>> +               msleep(100);
>> +               clear_bit(I2C_HID_RESET_PENDING, &ihid->flags);
>> +       }
>> +
>> +       i2c_hid_dbg(ihid, "%s: waiting...\n", __func__);
>> +       if (!wait_event_timeout(ihid->wait,
>> +                               !test_bit(I2C_HID_RESET_PENDING, &ihid->flags),
>> +                               msecs_to_jiffies(5000))) {
>> +               ret = -ENODATA;
>> +               goto err_clear_reset;
>> +       }
>> +       i2c_hid_dbg(ihid, "%s: finished.\n", __func__);
> 
> super nitty, but I wonder if your i2c_hid_dbg() message saying
> "waiting" should move above the check for
> I2C_HID_QUIRK_NO_IRQ_AFTER_RESET. Then you'll have a message printed
> before your msleep. I guess technically you could then add an "else
> if" for the second "if" statement which would make it more obvious to
> the reader that the "wait_event_timeout" won't happen when the quirk
> is present.
> 
> Above is just a nit

I agree with you that it would be better to move the
mutex_[un]lock(&ihid->reset_lock) calls out of
i2c_hid_start_hwreset() / i2c_hid_finish_hwreset() and into their
callers. I'm preparing a v2 with these changes now and I'll also
move the

       i2c_hid_dbg(ihid, "%s: waiting...\n", __func__);

line to above the I2C_HID_QUIRK_NO_IRQ_AFTER_RESET test for v2.

Regards,

Hans



