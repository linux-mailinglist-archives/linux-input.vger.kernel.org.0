Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD62877885
	for <lists+linux-input@lfdr.de>; Sat, 27 Jul 2019 14:01:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728080AbfG0MBa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 27 Jul 2019 08:01:30 -0400
Received: from mail-wm1-f44.google.com ([209.85.128.44]:34146 "EHLO
        mail-wm1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725975AbfG0MBa (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 27 Jul 2019 08:01:30 -0400
Received: by mail-wm1-f44.google.com with SMTP id w9so39712669wmd.1;
        Sat, 27 Jul 2019 05:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=BzHuFvoRywu7/+3CAPgMLJskj79GTte0iQAInAuEBk0=;
        b=vThsmw0tCLmat2Ys+CS8+iW9Pl+gCfZN9vcLNKCMh1M2a09MXxCJLMCNusqwvinfws
         fjCCgTlCwXXb7rZ2zWXqG4NTL9XU6u32UUV9NdriXxnf9ufiEMAaI3/qtPXr8bYVLGCA
         5l6pfdqm6EAvAe7hb0m492058r5IodmT92lFamS7G5Crx+yc+C+eEwnIyAOYjrCdECac
         b4JVPTjR1nbEPOk+tueytg7MY2ac5bymNr1NWziA2OrE5Jnh/DSUKt434C0O4jNUCY+i
         dnScdNjeqHx6m737R/RnudEoRALrNS1zxH9rVR4eZ2/cPHdNTX93AYMJlu5xJVhvmG2o
         7LOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BzHuFvoRywu7/+3CAPgMLJskj79GTte0iQAInAuEBk0=;
        b=pCKCdLw3RdfPJ+Hmf8scpIOCyfmuXRxAPJrOlgsqwyDyZhJtxJMrlpBtVlz6JbsmAv
         1EZu55zMt6+pa/oA1EbcomGcxVPUR7tptjOgIfwOQHYrm0ijAFjKJahatsoRItnQ6ZK1
         Sm1toTls2LieAJfuRjuxvLIWfmUrS+VoXkFwfVHQQxNp/QFW1pi6mbxSShqBHGRG7sku
         M2bmQZ/pnA1qxhUpuxwGF0zWqr+kAbIfsA3FGldTbQ3b76ZoHARrnv21sEL28oVcTtFq
         aazqJhkb9eje25zJk8T0PDxbOmdNLuFaBfMwV6dJUyQetP7FigrTo8IjC79PpUnWuW7D
         KzfQ==
X-Gm-Message-State: APjAAAXAHm9iZJidRBvZv55aCG3ivZLbHQvSjfUcjikHtmK4c9V1wca+
        QdLNLZt8EkmIgKoNP4AltAs=
X-Google-Smtp-Source: APXvYqwHn40PeIiZpTilHxYc5IpQAFqaPj5T57XFsRE5QMVgKup6IdGlkPTXI5DRRjhWA6EyqfFb7Q==
X-Received: by 2002:a1c:c14b:: with SMTP id r72mr74522683wmf.166.1564228888420;
        Sat, 27 Jul 2019 05:01:28 -0700 (PDT)
Received: from [192.168.2.202] (p5487B5D1.dip0.t-ipconnect.de. [84.135.181.209])
        by smtp.gmail.com with ESMTPSA id j10sm94313757wrd.26.2019.07.27.05.01.27
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Sat, 27 Jul 2019 05:01:27 -0700 (PDT)
Subject: Re: [PATCH v3 2/2] Input: soc_button_array - Add support for newer
 surface devices
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Chen Yu <yu.c.chen@intel.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
References: <20190720150511.95076-1-luzmaximilian@gmail.com>
 <20190720150511.95076-3-luzmaximilian@gmail.com>
 <20190727091443.GC795@penguin>
From:   Maximilian Luz <luzmaximilian@gmail.com>
Message-ID: <fb53b082-4d83-83a6-1ae6-b9fae9dc750f@gmail.com>
Date:   Sat, 27 Jul 2019 14:01:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190727091443.GC795@penguin>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 7/27/19 11:14 AM, Dmitry Torokhov wrote:
> On Sat, Jul 20, 2019 at 05:05:11PM +0200, Maximilian Luz wrote:
>> -
>> -	error = gpiod_count(dev, NULL);
>> -	if (error < 0) {
>> -		dev_dbg(dev, "no GPIO attached, ignoring...\n");
>> -		return -ENODEV;
> 
> I do not think we need to move this into individual "check" functions.
> It is needed in all cases so we should keep it here.
> 
> How about version below?

Makes sense, looks good to me!

Maximilian
