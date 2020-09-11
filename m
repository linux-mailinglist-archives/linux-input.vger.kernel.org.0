Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3EB72664C3
	for <lists+linux-input@lfdr.de>; Fri, 11 Sep 2020 18:45:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726262AbgIKQpV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 11 Sep 2020 12:45:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726383AbgIKPIO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 11 Sep 2020 11:08:14 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B59F8C061363;
        Fri, 11 Sep 2020 08:05:31 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id b19so12676597lji.11;
        Fri, 11 Sep 2020 08:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9xH3epKRNPx2qi/CXW+u5r8NOer+qrJmaVy7XkssMow=;
        b=X+JqPqRrJLPk/B9o/4p8HmfPi5511qYN/5Yg7z+ssZ5wkNlZ2ELJwjPrk98TaEMU8q
         Cn4w4Dj8o9ci3jyrxDii47E+Y9MzdasTOMPzqijjYfqWQGGr0hshEvifDjdaR58Oj9n3
         4q4NutmGekV3oIRd26eDLEpPf09pQBMZBf9RAkVUpCz0HskKqwzzsrc1fSMxRS3o1wQH
         M0GquIFAZKXpoZCN3rk7I0ItOLlV81kL4aOSz24eEtOwRK8ul6XbI0uBKE3coeqbcO6n
         pAuRn7cM0/7H0L9KQrSgqJrexwzUSJ8k5ODnlkgfP/AMKtVE19H702i93uX0XjwKcxwW
         Exkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9xH3epKRNPx2qi/CXW+u5r8NOer+qrJmaVy7XkssMow=;
        b=jQlXfMrLppLJLl8sE138fdbuq6NL9Ub4PvTrzfvbtjbhX6z0BUMVFkfZEK7aR2xZCm
         L+KqSmUuIMf7YCnDHYGJS0nIcwD/LBnHPqt3UjxXGH2LmFGfzHqwDlPZYgiOfBwoS75T
         KpwrmVJk8YGkDkF7qWhtCw15B+uea0Zvg5JBV6mEJRkSmh6Uo66GkYVpkml/XEgOJB/f
         UlGZtdyNCWQ/FYQscYWG1iRaRtFLHtnGFvgr3y2MwY3SARXmcTKEdBnkR408XgfujWA/
         S9v2UxD9J7ktHGdEPG5F97nuIjbD/smbkVWGnx2COrZxKaqVx24OVMPe89BbS/HeN5pX
         L51Q==
X-Gm-Message-State: AOAM532hfIvvD9j9ijJRWdq4z348ZUft3D4edFmphXfxxNn3BqEKTOE+
        gxyYPAHrhk/iApx6twB+hds=
X-Google-Smtp-Source: ABdhPJzNKbcqTi8VOqJGmV2fT49ChO/+dnbikZWWIGjyifJQj6IkZxP0CWbD+FwbgmlIFYC8KffjTg==
X-Received: by 2002:a2e:3615:: with SMTP id d21mr1024832lja.111.1599836730188;
        Fri, 11 Sep 2020 08:05:30 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id q7sm111317lfp.223.2020.09.11.08.05.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2020 08:05:29 -0700 (PDT)
Subject: Re: [PATCH v3 1/1] Input: atmel_mxt_ts - implement I2C retries
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Jiada Wang <jiada_wang@mentor.com>, nick@shmanahar.org,
        dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andrew_Gabbasov@mentor.com, erosca@de.adit-jv.com
References: <20200908151617.12199-1-jiada_wang@mentor.com>
 <6041c677-592b-388e-2eb6-3287a3d92e4b@gmail.com>
Message-ID: <ec77e42c-ea72-bbae-e1b8-1e11cca17f87@gmail.com>
Date:   Fri, 11 Sep 2020 18:05:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <6041c677-592b-388e-2eb6-3287a3d92e4b@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

11.09.2020 17:50, Dmitry Osipenko пишет:
...
>> @@ -626,6 +627,7 @@ static int __mxt_read_reg(struct i2c_client *client,
>>  	struct i2c_msg xfer[2];
>>  	u8 buf[2];
>>  	int ret;
>> +	bool retry = false;

Andy suggested to write this hunk like this:

	struct i2c_msg xfer[2];
	bool retry = false;
	u8 buf[2];
	int ret;

This is not a mandatory request at all, but it will make this particular
piece of code to look a bit nicer.

There is also an opportunity to improve formatting of all variables by
sorting them by-length across the whole driver, this will improve
readability of the code. But of course it should be a separate patch.
Please note that I'm *not* saying that you should create this separate
patch!
