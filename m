Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E39F6243EE2
	for <lists+linux-input@lfdr.de>; Thu, 13 Aug 2020 20:33:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726244AbgHMSdY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 Aug 2020 14:33:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726167AbgHMSdX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 13 Aug 2020 14:33:23 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0ACADC061757;
        Thu, 13 Aug 2020 11:33:23 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id h8so3548275lfp.9;
        Thu, 13 Aug 2020 11:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=sIbcE5ODjfrhDYPnzvl33BGmc5yNcFjg9cy67ZxLYb0=;
        b=qiDYdQnu5JW6I3kVj6Zc2O7cgctSak2P8gJSzLteZd8tmtwLPc2Ce+eNpfLha8OaVK
         tiThwyNMddL1zgmyiYU118jJJRBtAquzNdqtsVlAKHxoCSh/wEvb3+pP3hZmctEq1lXn
         F6LLnQwhpn1zb+ef9J6wzl/FHQ4XndA+jgVqER+Wi4o5n6EvirvQ/skMPY0C3XLs3jx3
         zp5IXAsyxLu1VtPK00SFCKg1NkdXGlrrXF25AuyGr2YdLt4hEL8vRk/UezAJFyK6z8tV
         ZZ/cyPQhYA4FHiVIVjcZV/Ux8nL88Phx9u9DQWDzy8WkdCs/ya20LW1ewTUmvCai0msf
         3alg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=sIbcE5ODjfrhDYPnzvl33BGmc5yNcFjg9cy67ZxLYb0=;
        b=XK/Oyl5U2GzmRCKboHR2OEIt+qoOzdgGBTcZY2IJn8+vKvRUVkZUDff97BVXqOKoTT
         Fdo2s/H9JAja8ef4+mhjgkWV3HVZjOhMLMYGP0bofOxTjkNEp6bwToMflSWKr5n6aCdx
         MX0TMFMzkQUgeeXsR4tQ+inloIzrXV+IyceUNL5q4lC8lrBhHXRCQAlwVwz/HQrLovUU
         IR4T5c8ZS7aQdeQSnIQ7vqvCR4MTTShKIL7MzoHL5WofybmqUeH9+eOSE75XfmUpi5Kg
         CrErNbxxrx5jKI0vrdbS2tqtyZLNgpFfyMm6Z60Md7r2xa+DKzpXu5OeNgRjUA32Bosr
         KTMg==
X-Gm-Message-State: AOAM532jCdqMGSsH3c/iftkHTV3isKDQGbfKv10B8+kvP8Nw3WLf5xj/
        4yWvQOwr+4ImM7aufzbpd4/MVEm2
X-Google-Smtp-Source: ABdhPJyFi7uYvAVNZzf4OFvdyC4AV38HSkoRdisRnK6CknK8QmcqYiOyXvGK65vmVDII8vs4f4XbIw==
X-Received: by 2002:a19:24c2:: with SMTP id k185mr2838964lfk.120.1597343601268;
        Thu, 13 Aug 2020 11:33:21 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id o25sm1285044ljg.45.2020.08.13.11.33.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2020 11:33:20 -0700 (PDT)
Subject: Re: [PATCH v6 5/5] input: mt: cleanup open-coded __set_bit()
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     Henrik Rydberg <rydberg@bitmath.org>,
        James Chen <james.chen@emc.com.tw>,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        Scott Liu <scott.liu@emc.com.tw>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1594599118.git.mirq-linux@rere.qmqm.pl>
 <cf1dda3a372896cb01033ce084a7deb9620df7aa.1594599118.git.mirq-linux@rere.qmqm.pl>
 <20200716003047.GA1665100@dtor-ws>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <eddb596c-dfd0-b32f-344f-7a494e78a43f@gmail.com>
Date:   Thu, 13 Aug 2020 21:33:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200716003047.GA1665100@dtor-ws>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

16.07.2020 03:30, Dmitry Torokhov пишет:
> On Mon, Jul 13, 2020 at 02:24:55AM +0200, Michał Mirosław wrote:
>> Replace open-coded __set_bit() with the function.
>>
>> Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> 
> Applied, thank you.
> 

Hello, Dmitry!

Could you please let us know how we could proceed with applying the rest
of the patches?

The device-tree for Nexus 7 2012 [1] has been merged into upcoming v5.9
and I'd want to add the touchscreen support.

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=2720008f4239cf36d57b8d0b3cb2a49d4368a378

The missing elants_i2c driver functionality doesn't really block making
a device-tree change since elants_i2c.yaml DT binding already supports
the ektf3624 TS model, but will be nice to get a full featured support.

Thanks in advance!
