Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D040918D35E
	for <lists+linux-input@lfdr.de>; Fri, 20 Mar 2020 16:54:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726953AbgCTPyA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 20 Mar 2020 11:54:00 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:42039 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726840AbgCTPyA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 20 Mar 2020 11:54:00 -0400
Received: by mail-lf1-f65.google.com with SMTP id t21so4929593lfe.9;
        Fri, 20 Mar 2020 08:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1V8FF9eJrm9wvwD4q3tqsWWsW0ZrqInhPAWcIStqMyY=;
        b=Y3aVTjLECSkF093nyIgekKyw2TJGu4YSFGj2zNevrKYE2v5CWDPQiIl+adnZq+y+Oy
         uJ6PniVUeFVg0KqllKNg2jLhDkM++/+1zMfN364Ht9dtCR7lvhkZxyxKYIm6NWpzPMXJ
         obNd8/Z0J3qDm5iBmDTBFPM/sHo3Fqc+JhQ3ot9cnxj0ZYejOIfZ/Esu8eK/ye9zV24H
         UXPLxFGmvtfAG0iC/rtm6nlbSBpMffiNGRvC7+69rx+eA8MxyWOz11IXC0GZmmieBdCx
         GGKvUv0WFT/Z9Di5HlF7WT8zqjuPqUAKQ+zF++L1ZvaU57ILjGqwa7cIJH7TdGHd0AAP
         Vs9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1V8FF9eJrm9wvwD4q3tqsWWsW0ZrqInhPAWcIStqMyY=;
        b=ACCPDkebZGepKhejPoZFhE/us3QvhpNnz7KrSJMRfM5PeqVk4Q4MyCwZsRqU043xu7
         NFGyEktdzdEZJ0+VO1qG1IBS9wQGjeuvikHc9D+kbHYdSH/WJptGdFrpEi9qpjPqhhB5
         7gCSai7UzpElp9ozBpLiBIpyJn1Uh3OaK0i92Bz6ynGO1X5SSHq3klFGODISVSQEXylP
         TLhjnmubtO18F1eymoEHJgJSROl1NKSCjWE4vefSSVQl7FkRWfa5709ospN3KgNQTsKw
         qY990cGT04gp6G6amYxo3Oqnh96K9EG8I46KnSSjup63mkfqDsZxxsz0YdnPeMGUtoAQ
         xAhA==
X-Gm-Message-State: ANhLgQ0msmQ/ArCc+X9eZetXKH4cQ6jmSSwKUA8HGjifVbauKIZrv4bS
        lFi9Z+w8Ym1GVyIPrhszm8g=
X-Google-Smtp-Source: ADFU+vtu5cEYNc1o2tNDXGsVXlSY1xVgFic5YowTxtx9YfTm+lQaO/ztP5C9wnLSHzL2LIXwaK2fpQ==
X-Received: by 2002:a19:fc12:: with SMTP id a18mr5857736lfi.117.1584719637199;
        Fri, 20 Mar 2020 08:53:57 -0700 (PDT)
Received: from [192.168.2.145] (94-29-39-224.dynamic.spd-mgts.ru. [94.29.39.224])
        by smtp.googlemail.com with ESMTPSA id k2sm3721398lfc.95.2020.03.20.08.53.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2020 08:53:56 -0700 (PDT)
Subject: Re: [PATCH v7 00/48] atmel_mxt_ts misc
To:     "Wang, Jiada" <jiada_wang@mentor.com>, jikos@kernel.org,
        benjamin.tissoires@redhat.com, rydberg@bitmath.org,
        dmitry.torokhov@gmail.com, nick@shmanahar.org, bsz@semihalf.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        erosca@de.adit-jv.com, Andrew_Gabbasov@mentor.com
References: <20200212084218.32344-1-jiada_wang@mentor.com>
 <c583d151-9243-cbde-a04b-bc0389d9be5a@gmail.com>
 <89e4bb0b-b2eb-0b67-4307-fb2af914b1c0@mentor.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <f9b221e7-f189-3e47-adab-1cbc49490d4b@gmail.com>
Date:   Fri, 20 Mar 2020 18:53:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <89e4bb0b-b2eb-0b67-4307-fb2af914b1c0@mentor.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello Jiada,

20.03.2020 06:37, Wang, Jiada пишет:
> Hello Dmitry
> 
> I have submitted v8 patch-set to address your comments towards v7
> patch-set,
> most of checkpatch warnings and errors have been addressed,
> 
> But I didn't update for following two types of warnings
> since I want to keep consistency with legacy code
> 
> WARNING: DEVICE_ATTR unusual permissions '0600' used
> #290: FILE: drivers/input/touchscreen/atmel_mxt_ts.c:3761:
> +static DEVICE_ATTR(debug_v2_enable, 0600, NULL,

What will happen if you'll use 0644? Will an empty line be returned or
driver will crash?

> WARNING: Consider renaming function(s) 'mxt_debug_notify_show' to
> 'debug_notify_show'
> #292: FILE: drivers/input/touchscreen/atmel_mxt_ts.c:3763:
> +static DEVICE_ATTR(debug_notify, 0444, mxt_debug_notify_show, NULL);

Perhaps this should be fine to ignore, although the prefix is indeed a
bit superfluous.

> please let me know if you have different view on this

Thank you very much, I'll test v8 during the weekend.
