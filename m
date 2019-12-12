Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14EE011D6F6
	for <lists+linux-input@lfdr.de>; Thu, 12 Dec 2019 20:20:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730375AbfLLTUN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 12 Dec 2019 14:20:13 -0500
Received: from mail-pf1-f177.google.com ([209.85.210.177]:43041 "EHLO
        mail-pf1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730338AbfLLTUM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 12 Dec 2019 14:20:12 -0500
Received: by mail-pf1-f177.google.com with SMTP id h14so1320323pfe.10
        for <linux-input@vger.kernel.org>; Thu, 12 Dec 2019 11:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=/lvzXhfWe8iZy3CcIMZK5n0RIHj7hmbXuDMFZpKd1nQ=;
        b=DYo9p2ck7I5dPTO6j9AYmLDZYHC7z2GvyTr7nngIwqNYlhVRt7LvD3dWnp5rd9rkAB
         vvWGt09fGK3nh0f5GaM37OIj36r8bUJmeGiLM1TOll1YMrxqpISmRGIHLpupOeA/z5X2
         rOrzMlminYNh6F7S6/yW2uaIvYq33W/FjDKlDg1ROFwDndOcop0kFYu2qZJ6X1nXw/YP
         Q7kAHvt1yH2XRrb/FmUFCHlUurIlpC68mIRmUMG7/21pq3L9JqJ162eBpzIB840fF4rO
         Xxwi28qKUKqxY+o/2zO+5NkTP+nIin5vEG6FinMFUWfEEiVoqUSJMlH0qU/2CLP2leBy
         w+5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=/lvzXhfWe8iZy3CcIMZK5n0RIHj7hmbXuDMFZpKd1nQ=;
        b=Vnicy80ftdqQA8LjjcADGr24cRDmpA+xTIoCkAfzODRd7NI9uKDUGXeRImZ1Za5X/b
         5ViqRm2bo5ziBlVUoIKp15Uda3xS9k11AulkvV5rKr/+HAaAYznh4gb+026bfVCAvfFK
         nvrR9FjdT4mP/nF+ylOcgJNaTRO54Jk+ajQO1AudxaVdqPVAMU5Ay9ASpglv9wQUeS82
         ywRGtH4QYJ8+V73uozeTuQ3gTpOGGVQSYXUM7BjP6Pe093ASLn5BzNBFLaTOcPn8xG6u
         DPGyGdOKSx2uO0f/CsU8wM278IzH/7AdPJazWmjRkoDc5IACTLZTLOd5yGmRC3tIFs9g
         QaZQ==
X-Gm-Message-State: APjAAAWLt3zphwfyvykqOlwcZ6rida4X7jYKNOuN1vm6yertB8ko6iYf
        xlG7h3/xAqXjJMNM3gy3boQ=
X-Google-Smtp-Source: APXvYqxyOZiOTrU+0ncU+w7avT7PvI2vfhzag5B0aoAaBqmTiSj/eW3h+b51eFdZLz72Z21fqnsrDA==
X-Received: by 2002:a62:5bc4:: with SMTP id p187mr11771663pfb.255.1576178411988;
        Thu, 12 Dec 2019 11:20:11 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id e1sm8321342pfl.98.2019.12.12.11.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2019 11:20:11 -0800 (PST)
Date:   Thu, 12 Dec 2019 11:20:09 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Dmitry Mastykin <mastichi@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Bastien Nocera <hadess@hadess.net>
Cc:     linux-input@vger.kernel.org
Subject: Re: =?utf-8?B?0LLQvtC/0YDQvtGBINC/0L4gc3Vz?=
 =?utf-8?Q?pend=2Fresume_=D0=B2?= goodix
Message-ID: <20191212192009.GB101194@dtor-ws>
References: <CALieaefYFFBaFAo4E7hsESrxhN7N_tbWbeG_C6WHzwDpFiLqeQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALieaefYFFBaFAo4E7hsESrxhN7N_tbWbeG_C6WHzwDpFiLqeQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

On Thu, Dec 12, 2019 at 06:34:46PM +0300, Dmitry Mastykin wrote:
> Здравствуйте, Дмитрий.
> Простите, что отвлекаю, если что - не отвечайте и в лучшем случае
> пошлите в mail-list)
> У меня есть планшет с x86, вариантом Debian с ядром 4.15 и
> контроллером тач-скрина gt928.

What is the model of the tablet?

> После suspend/resume не всегда, но очень часто тачскрин перестает
> работать и постоянно выводит:
> [ 3276.729412] Goodix-TS i2c-GDIX1002:00: I2C write end_cmd error
> [ 3276.770153] Goodix-TS i2c-GDIX1002:00: I2C transfer error: -121

When this happens, are these messages appear constantly, or only in
response to actual touch? Can you still interact with the device?

Could you please send the full dmesg so we know more about the device.

Hans, Bastien, have you seen such issues with Goodix occasionally
misbehaving on resume?

> По i2cget/i2cset контроллер успешно отвечает.

The fact that you can talk to the controller like that is interesting.
Just to confirm, does it return sane data, or garbage?

Thanks.

-- 
Dmitry
