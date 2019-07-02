Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9DE9C5C6E8
	for <lists+linux-input@lfdr.de>; Tue,  2 Jul 2019 04:04:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726803AbfGBCEl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 1 Jul 2019 22:04:41 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:34475 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726486AbfGBCEl (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 1 Jul 2019 22:04:41 -0400
Received: by mail-wr1-f66.google.com with SMTP id u18so7678537wru.1;
        Mon, 01 Jul 2019 19:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=cC24HskbbBfAYQjpG+ffaC/VHKFfDt1GzRC+shKM3B4=;
        b=AvujA4SnQ8zxnHu93jV87ajTEC54BPX56k7Cm/ule4kFTHu+IayTzJ3o5jb5pNDXfV
         N1LbSfF1MU/L8mGuZcuSlS9FbPI8T5zbjmNedknRRKuKKcwWPcqlWFyvwJ/9+8v++q7D
         Aq9fgIBn982l0WFRLX/AuWX5Fw0HHltAUuBFlBPSoOPxt1LQ5BmzgpcBefapWvMrM7Am
         NeJt1v1DJ9xjKuKS0dW6BIgxy6KZNV6PUeTDRc+7XWRsVDAn/0wy83iY+PHiPe/e4yfc
         1splfHMkDb+yB1AyjSkzRz+TYGNwBCLhAx/SHotCy6HFQC7PleD2WTYaddQaMJ+Prr9Z
         2b3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cC24HskbbBfAYQjpG+ffaC/VHKFfDt1GzRC+shKM3B4=;
        b=lCuSgp1AtLfaZDD8cyLJsY7R6NbvY3hN8TYHDLlVTOUQvotYzGij9SfVOFgQqIjx2I
         GL6wMiNX40tlH6ytG55oZBXCfkqHMZg3ZtP38GONRsOMDQu49i8C0CzeASzwoAb6FVA1
         oq34n3r4MsSM64AAYa4OQz3eam7u/JPr4FCz7BP0uOuY7czZz/cUQrfkv6xmo4k2QQxm
         OrWOlxJTmp63ilrKdcRARSHzOM4fBxVHKuOtULGxxCjKntoBZWeNaovR+c6y/r9n0dcH
         b6rZf5+iGgF4BzLhmkwOPEVLTu3rN1fBiX5fiUv2zWY5Jo3EfCzrXTAqU+vpDqwFAK/f
         KVYQ==
X-Gm-Message-State: APjAAAWlnwIiZThVJoOiEUW/JX99O5+H1aoQ2fUa5UWyBbrCXH8KxYMV
        eSTjR7ZxQqh9nb0rLCmoaMo=
X-Google-Smtp-Source: APXvYqzwMiWb7AaYJOGdenk/mB+FUODCRipS/iQOKLhn2j2Wxg8EvSYMHHlv5uD0y6hevjCLdUkLnw==
X-Received: by 2002:adf:f649:: with SMTP id x9mr19259049wrp.86.1562033079629;
        Mon, 01 Jul 2019 19:04:39 -0700 (PDT)
Received: from [192.168.2.202] (pD9E5A169.dip0.t-ipconnect.de. [217.229.161.105])
        by smtp.gmail.com with ESMTPSA id i16sm9091440wrm.37.2019.07.01.19.04.38
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 19:04:39 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] platform: Fix device check for surfacepro3_button
To:     Yu Chen <yu.c.chen@intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
References: <20190702003740.75970-1-luzmaximilian@gmail.com>
 <20190702003740.75970-2-luzmaximilian@gmail.com>
 <20190702011443.GA19902@chenyu-office.sh.intel.com>
 <91349d00-e7e2-887b-45e5-4689a401aa2f@gmail.com>
 <d7e17f54-4c33-fa8d-be03-9e507da8e495@gmail.com>
 <20190702015717.GA20346@chenyu-office.sh.intel.com>
From:   Maximilian Luz <luzmaximilian@gmail.com>
Message-ID: <3eab65a6-90d6-d598-2b16-805c28864716@gmail.com>
Date:   Tue, 2 Jul 2019 04:04:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190702015717.GA20346@chenyu-office.sh.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 7/2/19 3:57 AM, Yu Chen wrote:
> How about using a boolean, according to the function name, if a mshw0040 revison
> is detected then returns true other wise false. Other than that,
> Acked-by: Chen Yu <yu.c.chen@intel.com>

I can change that if you want me to. Just thought this might be a bit
more flexible in case we ever have to adapt the check for future device
generations.

Thanks,
Maximilian
