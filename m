Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9EE9A1834EF
	for <lists+linux-input@lfdr.de>; Thu, 12 Mar 2020 16:28:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727481AbgCLP23 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 12 Mar 2020 11:28:29 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:43414 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727455AbgCLP22 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 12 Mar 2020 11:28:28 -0400
Received: by mail-lf1-f66.google.com with SMTP id n20so1847621lfl.10;
        Thu, 12 Mar 2020 08:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=DM2sty0HqS4SZcjmZmsbs99dVfE/89uzdO4Kf3eNQ5g=;
        b=sg9TuAzG5qW6xY9HltsXNCanIGZsfcL0BeS892DQrm1giBIt2t4L1NgdMWRRMNvcjy
         9guRUE5ip4P+jhw01Fk71KagofpCtyt/Lp2hxM5dDP23aoual5cA+ExNVubbtNGnBefe
         jiIMzk2NDoKssSOL6l1T7VXfRCbPCKTpWsSY1fuYMLmazzRLskhpOgBf7MvMW79og1O5
         YyK3PhXcfbUmSQC0REDDDdFh2e0/ZAgxJYFO550UP/thdNuzR+UMrcux6IY+SNPhCLUD
         ZHTlD7DX/A/xhWVA0K/M8VOhDbgahaysXsDw+1T2+QT/0fOqgQrAs23ZAJ7rsW4sez/e
         YMOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DM2sty0HqS4SZcjmZmsbs99dVfE/89uzdO4Kf3eNQ5g=;
        b=gxOTYKioxi/vV+ICsO+FiXec6mMIRDDI3HgBTqq9YpQGdq4Rkr7I8628l0NnUnoKi9
         z6mDBqROBYYNwG6lExJlNJF7U7r8DWdLgiTcPjcmGybqGin+bmC6E1ycPKWlyqw1qbBC
         Txzl4JajGot5dl49MXdpdxGBBrnpbpIBGsIzC/QDFQ9ffXT4DX5tdZkwnR0vr0AArmeu
         ACzJvH0ML0KviaMLhr9k7Mime+KjZpss1pV4UPYNedML82xUflYsnkfQCH2uomq+JT08
         M+7yJjA4qFUe75kctL0rZXOteO/tDPJ1Uv+5WrIfaKW+jRon23ctgrrYZ4jAdK5B1Biq
         NNDQ==
X-Gm-Message-State: ANhLgQ2HRakehEW4WweOMONm28yV0hbJviuIiGtOy63BEhIZMprZvb5v
        K0ypgk2PHeHJ72+7c429200=
X-Google-Smtp-Source: ADFU+vtxFv8DhF7vIjuzvEEPvjnlbd7m5Q+3k45o5vga19ZbyTyEur99j5YlrRQSzUD1rArkfjv4AA==
X-Received: by 2002:a19:cbd5:: with SMTP id b204mr5552015lfg.102.1584026906577;
        Thu, 12 Mar 2020 08:28:26 -0700 (PDT)
Received: from [192.168.2.145] (94-29-39-224.dynamic.spd-mgts.ru. [94.29.39.224])
        by smtp.googlemail.com with ESMTPSA id o7sm28916578ljp.95.2020.03.12.08.28.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2020 08:28:26 -0700 (PDT)
Subject: Re: [PATCH v7 22/48] Input: atmel_mxt_ts - improve bootloader state
 machine handling
To:     Jiada Wang <jiada_wang@mentor.com>, jikos@kernel.org,
        benjamin.tissoires@redhat.com, rydberg@bitmath.org,
        dmitry.torokhov@gmail.com, nick@shmanahar.org, bsz@semihalf.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        erosca@de.adit-jv.com, Andrew_Gabbasov@mentor.com
References: <20200212084218.32344-1-jiada_wang@mentor.com>
 <20200212084218.32344-23-jiada_wang@mentor.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <bba38969-b245-6b79-3836-099c2ded3c22@gmail.com>
Date:   Thu, 12 Mar 2020 18:28:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200212084218.32344-23-jiada_wang@mentor.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

12.02.2020 11:41, Jiada Wang пишет:
> From: Nick Dyer <nick.dyer@itdev.co.uk>
> 
> The code is much clearer if we switch on the actual state the bootloader
> is in, rather than the state we want it to be in, and allows the removal
> of a goto retry tangle.

...
>  	case MXT_WAITING_FRAME_DATA:
> -	case MXT_APP_CRC_FAIL:
> -		val &= ~MXT_BOOT_STATUS_MASK;
> +		if ((f->previous != MXT_WAITING_BOOTLOAD_CMD)
> +		    && (f->previous != MXT_FRAME_CRC_PASS)
> +		    && (f->previous != MXT_FRAME_CRC_FAIL))

This will cleaner to write as follows:

		if (f->previous != MXT_WAITING_BOOTLOAD_CMD &&
		    f->previous != MXT_FRAME_CRC_PASS &&
		    f->previous != MXT_FRAME_CRC_FAIL)
