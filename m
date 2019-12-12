Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EDDB511C15B
	for <lists+linux-input@lfdr.de>; Thu, 12 Dec 2019 01:30:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727303AbfLLAaT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 11 Dec 2019 19:30:19 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:46660 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727185AbfLLAaT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 11 Dec 2019 19:30:19 -0500
Received: by mail-lj1-f194.google.com with SMTP id z17so176066ljk.13;
        Wed, 11 Dec 2019 16:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=mgVjPBpyfVTYKp7+63M0bjTwmbLNn/Kfsk0p43t6uBU=;
        b=PYYGYzYSWKV2PqQB4n1wRuprl+RhHezanrtZ6Rw2jHwXb3x297I9nIlvtZfTyrxDkI
         Miu9HWz020yOrx5E3uZo23k9Ogd5jnflKCZr0vN1oXX2FYAubYOAtjuOmgMHbJ/qrHbD
         drSMxC/j+dhZ4qEWLFJJ2X8dN1mOO1oGUiapO5xGN6AFjyLUApWHyvwd/2za5SGqe4ZI
         sBhDaGH6L3V6puhmLDGwAUwWmluqqUEZz6/yTQxCWpNDQUZXH8N20qvv4P8RSwLkterD
         t3+qkkJH0u03n+0dmrAAfexVFz/WQ5bCR45uzaCjZad7FBaH5fw1W38Uwe2sHU+7FutG
         yhEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mgVjPBpyfVTYKp7+63M0bjTwmbLNn/Kfsk0p43t6uBU=;
        b=NkihYS5gHaX5ajwTrrhtlCL8b6epQFeBygHJlxyJd/S8TI38nIn4ftlQOG3VJZdcO5
         FBuZhlQX9UUWLJnM7nPMqYJKm7uID0lcxXPu2u4lj4AyAGkIhJZRHzhJylCm4Wsp7c3y
         gWs/i+2nkb7Ke5NEfUlkdyP//DEdLMC2KxEyD2LyDAlziw79SpIMx/WAKftE+N4mOPL6
         PfzWMcF/StEt1jtxYNPP9AGcoqqPHRVdRIa8q/5MZ9zrO37ud5hwE4MtyRLnDchYiuVx
         hlMmn8QWEvnnXCvdQhD/a+Pud5hTB+BoESahbv0XPxq5tnCFAUH2c39ks6eGI6UiNnQk
         5gbg==
X-Gm-Message-State: APjAAAX9yhm+R+RGmCXjJu6Jc76FjH1lJ62++fO83tPMZquYiYAX1cU5
        txVWyHzqQYIe49bl14fbnPU=
X-Google-Smtp-Source: APXvYqwO5foLVVJytsyxiKCrekNCooOHh4aENG+4C4O+uBUNnZwq8OmWKehIm1Ym44jZkUOg8dpR/g==
X-Received: by 2002:a2e:3619:: with SMTP id d25mr3992053lja.231.1576110617323;
        Wed, 11 Dec 2019 16:30:17 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id b14sm1946255lff.68.2019.12.11.16.30.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2019 16:30:16 -0800 (PST)
Subject: Re: [PATCH v2 5/9] input: elants: refactor
 elants_i2c_execute_command()
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org, Henrik Rydberg <rydberg@bitmath.org>,
        James Chen <james.chen@emc.com.tw>,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh-dt@kernel.org>,
        Scott Liu <scott.liu@emc.com.tw>
References: <cover.1576079249.git.mirq-linux@rere.qmqm.pl>
 <7d211bcab8d649f70e5bd324585dc383592d4187.1576079249.git.mirq-linux@rere.qmqm.pl>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ce088d14-5b12-2acc-56c6-93113abba4b0@gmail.com>
Date:   Thu, 12 Dec 2019 03:30:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <7d211bcab8d649f70e5bd324585dc383592d4187.1576079249.git.mirq-linux@rere.qmqm.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

11.12.2019 19:03, Michał Mirosław пишет:
> Apply some DRY-ing to elants_i2c_execute_command() callers.
> 
> Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> ---

Could you please explain why this change is needed?

[snip]
