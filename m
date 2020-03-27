Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5AFE195825
	for <lists+linux-input@lfdr.de>; Fri, 27 Mar 2020 14:38:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726515AbgC0NiD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 27 Mar 2020 09:38:03 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:39277 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726275AbgC0NiD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 27 Mar 2020 09:38:03 -0400
Received: by mail-lf1-f67.google.com with SMTP id h6so2104363lfp.6;
        Fri, 27 Mar 2020 06:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=34VhHnVfQfCxnUAIZ8aanvohxvRx0Xe7SWZvIT0s5dU=;
        b=kiGSVCIXBmiFG+Jwwm9T3FaTwCD64GutramKXcjpM2OEauD/AtMI8qnPyFBqt3OdTE
         Sm1zEdRlh0tqe6VorFmw7aO4OpsnGxTNOmK8n9r8gBYgWK6+gknRCgDRnjdW/XYNnJso
         qSQA1ZygeK+KHpyOeiiWLhj/gwIjwfkWuZ36c6JHCCLEnILkUMcz9RI2ubTqL5nVyNkP
         xuSySsqUjXDKFk/waIk+5TJkdVfCM5opGRqTm2DTqPcbBDIPQ6TX8AU2ijRdhv+AyegI
         /XGWSVZujj0oXL+CIETJ48GeqY2tV++cn2kDzSafb5u7MTufaGCCk0DUJMNXLc/x8Ndu
         yU0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=34VhHnVfQfCxnUAIZ8aanvohxvRx0Xe7SWZvIT0s5dU=;
        b=k6JR3HHjwT0CQhzwFGr1PeWEjQv9wbpBPVhy+lU5Y8PgMsV5wRfITGP2gZia+bJ1hc
         VxLBDMrPysADoMrxmEejXIglfndVW7yDJzMGlQqMfAL7UOtDQlwi/imLa48mOmDXXVjB
         JYYnqavvQWgC17FxHLp59moLx3Z70kVujC1XZFxGIsSWh6hv7+/LhopwIjlHAMJSs9At
         jul1nN8sfYDBuTk3ghrUzCjlZvdGpiTawlOw0++a5l/l9Dr8KwmB0pdzKKSTMDI+w642
         hY8pYc0L1t89oQ0GGKbdCCuCj3llDTp7znIIVhvX8NEVwIblz4Z061b15RQYoZ1f308A
         ovMw==
X-Gm-Message-State: ANhLgQ12e/L0PCiejXLDEpQS6O5YC7QYuYnJj6VCyUDtFiUR6aWvPlS7
        Xghp15mOk6B/w6ckBJAEp7c=
X-Google-Smtp-Source: ADFU+vuFudCZffsf6YDRuon6AaHUNJ7IM5uPoDfCX7HpjZkFAInAeO/S0gdrU7+Gj5wqF2SnvIoS5w==
X-Received: by 2002:a19:22cf:: with SMTP id i198mr9492426lfi.199.1585316281818;
        Fri, 27 Mar 2020 06:38:01 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id i7sm3031011ljg.99.2020.03.27.06.38.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2020 06:38:00 -0700 (PDT)
Subject: Re: [PATCH v9 52/55] input: touchscreen: atmel_mxt_ts: Added sysfs
 entry for touchscreen status
To:     "Wang, Jiada" <jiada_wang@mentor.com>, nick@shmanahar.org,
        dmitry.torokhov@gmail.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com, bsz@semihalf.com,
        rydberg@bitmath.org
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        erosca@de.adit-jv.com, Andrew_Gabbasov@mentor.com
References: <20200325133334.19346-1-jiada_wang@mentor.com>
 <20200325133334.19346-53-jiada_wang@mentor.com>
 <4aeda6f1-25d8-9437-5cd0-560e43dbe081@gmail.com>
 <b9368137-2fdc-558d-c27c-54d56950f7b8@mentor.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <5b03bf10-d4f1-fb3d-4561-1097630c195a@gmail.com>
Date:   Fri, 27 Mar 2020 16:37:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <b9368137-2fdc-558d-c27c-54d56950f7b8@mentor.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

27.03.2020 15:49, Wang, Jiada пишет:
>>> +static void mxt_watchdog_work(struct work_struct *work)
>>> +{
>>> +    struct mxt_data *data =
>>> +        container_of(work, struct mxt_data, watchdog_work);
>>> +    u16 info_buf;
>>> +    int ret = 0;
>>> +    u8 size = 2;
>>
>>> +    if (data->suspended || data->in_bootloader)
>>> +        return;
>>> +
>>> +    ret = __mxt_read_reg(data->client, 0, size, &info_buf);
>>
>> Looks like this need to be protected with a lock to not race with the
>> suspending / bootloader states.
>>
> right, I will add lock in next version

Alternatively, maybe the watchdog_work could be just stopped in
suspended / bootloader states.
