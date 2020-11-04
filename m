Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B4742A6B77
	for <lists+linux-input@lfdr.de>; Wed,  4 Nov 2020 18:13:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731225AbgKDRNy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 4 Nov 2020 12:13:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730362AbgKDRNy (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 4 Nov 2020 12:13:54 -0500
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE765C0613D3;
        Wed,  4 Nov 2020 09:13:52 -0800 (PST)
Received: by mail-ot1-x344.google.com with SMTP id z16so14811732otq.6;
        Wed, 04 Nov 2020 09:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=5LBE+JYAg1FMao9hDSNR2rR/Xnyuu7Kx1Nw4Aylqvuo=;
        b=FuH/YcBOkVgfFQCpmyWHXNs+ZKUF5WiOQWDQHkVLoDt6nc5LWXoWngQYvqonLc8SXy
         wL0TIF4lufy5aPW+leQnS982s7cVBU4PORcFXdwIM8jCZ5RxJKHhq+s+js6tTkfR1jVq
         w3Zv82LT1JVBcTeoykJasgFv39bPvUsGHOXDKQ6egofXFp7/bebUW9hpYKs4Hu1d5Fuy
         /VEM5p++xOz2hjvU1eApg518JjuDXGvnEOWb8hhEaQkq5Xj/Bp5G4JQ3+ZoUj/PppfjG
         fpbro8DzLrzmNwvxARiaIb1gEQjLl6NehbWaqSIa/ufctub3HqaHFjWn+Oyp9UUZGkIg
         vJoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=5LBE+JYAg1FMao9hDSNR2rR/Xnyuu7Kx1Nw4Aylqvuo=;
        b=RIcDQ2rMxQr9pa54DC/j3HPuFRya5s8EKMK7AZz2vR4ZuOlSpkNH8PA4VR9Jqf0Kge
         QnCoo7kzgF7/U/69+MkJ8ZWAgU9Mksup73nKBTsOe+iuLn8MayfDyqXCckOVRIbntSx9
         Fx40nUJomnZRFBKB2BY9e6oai1fLjTTFCF8u5Q6EDwtMtZtSzaUHia380J5ueB6aQ84j
         PQvlaU7imBO6T46AjlFXlgPbwmdSd5bBtk7PmopslN5EJP3j4zONaj7CJCzLqhcO5/pW
         RlO6PbOaHpQotASEpOetr7IZEkSFaBsfJIVLtVNxp6ljZA+T2wYO+OXqyn9f1urSHW+m
         LgtQ==
X-Gm-Message-State: AOAM530EV3kpRtECgx72rwbraaBTVvuSD+nFgcRRx2HU/f0lUobUiEn9
        8J0AiRNB3fw+XLOHn9TBCyp6uwjEwJEsMRtq
X-Google-Smtp-Source: ABdhPJxWfHOdKpuAoVyh9eKyY4bNewXcAgMq4q61VWgMeT7YRcBPLUxquxDt+Kh+vlGv8a381CSM9A==
X-Received: by 2002:a9d:6d19:: with SMTP id o25mr19778108otp.85.1604510032069;
        Wed, 04 Nov 2020 09:13:52 -0800 (PST)
Received: from ?IPv6:2600:1700:4a30:eaf0::21? ([2600:1700:4a30:eaf0::21])
        by smtp.gmail.com with ESMTPSA id g8sm579513oia.16.2020.11.04.09.13.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2020 09:13:51 -0800 (PST)
Subject: Re: [PATCH v2] Input: Fix the HID usage of DPAD input event
 generation.
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Chris Ye <lzye@google.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        lkml <linux-kernel@vger.kernel.org>, trivial@kernel.org,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
References: <20201101193504.679934-1-lzye@google.com>
 <CAO-hwJJVKOM7Om8E+kmYXTrA7SiOFgFt46BHfv+0j+ORhepbaQ@mail.gmail.com>
 <7505bbc6-9f76-0875-c1c1-95d611a980bb@gmail.com>
 <CAO-hwJK3EzeQbiPMy=8YAVp91nN6bMcAqqfzff+-6mti9PFMHQ@mail.gmail.com>
From:   Chris Ye <linzhao.ye@gmail.com>
Message-ID: <62b486c3-6cbe-495e-7843-1cffb010a685@gmail.com>
Date:   Wed, 4 Nov 2020 09:13:50 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAO-hwJK3EzeQbiPMy=8YAVp91nN6bMcAqqfzff+-6mti9PFMHQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Benjamin,

    We are using hid driver to inject hid report for D-Pad and Hat 
switch events, like:

       [0x00, 0x00, 0x00, 0x00, 0x01, 0x80, 0x00, 0x00, 0x00, 0x00, 
0x00, 0x00],

Check the HID format dump from kernel, this will send a 0x1 on HID usage 
GenericDesktop.HatSwitch.

Do you need me to help write the gamevice tests? I've not observed any 
regression from my side, as this patch is very specific to usage 
D-PadUp/Down/Left/Right.


Thanks!

Chris


On 11/3/20 9:36 AM, Benjamin Tissoires wrote:
>   I can emulate events for X,Y,
> buttons,... but I am not sure how the gamepad sends the events for the
> Hat switch and the D-Pad together.
