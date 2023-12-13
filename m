Return-Path: <linux-input+bounces-771-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E8781202F
	for <lists+linux-input@lfdr.de>; Wed, 13 Dec 2023 21:48:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6728F1C21081
	for <lists+linux-input@lfdr.de>; Wed, 13 Dec 2023 20:48:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE2F97A229;
	Wed, 13 Dec 2023 20:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kf81NAiX"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08C90AF;
	Wed, 13 Dec 2023 12:48:52 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1d35569b8c6so6531705ad.3;
        Wed, 13 Dec 2023 12:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702500531; x=1703105331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aYbkCKN4bZ+e14B1IGZqddPmME1LbiV7DWDyMdXMas4=;
        b=kf81NAiXL78CdsiFbcL62saDJvLP/7BymPMHs6IfSa1lncHG10tqRIGoaTUJTexAAd
         GadrdXWB9iMV8YoT8riefvZkOWj/7IL8hsYyUbpmt33/fPRTEkve5OQptpJPYTbsYoVP
         gtdf3KTAIs6pXi+q6+Bqu7kdUJeXsm5lGd6N+mjAigu+8bD5JnVw2dd7x7A/XFeFg6ht
         5Au6ik7lrQA624R5f+xKOlBdd8VhQLjPT4L6FsS6OUHRBDqeR0fSNEevjObhnefhZWUG
         WDJyhjNLXnTu2B9AX3LGeej1QFAgCCX6d57uHiiH2tJ9gTT34pJ89qvX4fb59OwwStfe
         9vbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702500531; x=1703105331;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aYbkCKN4bZ+e14B1IGZqddPmME1LbiV7DWDyMdXMas4=;
        b=QLh0GeRpoyutVnUkrKv8/q2ujLQQM/kSjPc1dzqqo7kqQ6SNlGHQ+sONk9tACYx9l7
         SFA72y0uLDwwAJ1TFfTYpqWYMrjDYw9IJgicsquXHWn7yvqg37+qQrf4MYbQ+fRLjQao
         XfnPgS3ywkjgMK4lKpxkAW885PTRF4bWz5+eOV7OCJcB4wV8poNa12ZEzCFRNuPJ28AE
         qHAS2Ne7Tf4l8IPGPysxUijJkRg1Ww/JLt5dXfV0JjjNDXXV72h3ZT1XJGwFtY+9iKd0
         cq1icwtvlc9d7EoVKmXdwNR1SfA7QnwpL++tebAKtcEZ1F8kWPdrIooI1qeiNS18oIFp
         A2Tg==
X-Gm-Message-State: AOJu0Yy/ZAXUPdh/Mh9vqI0jqey8zaUQhpnd+6gWjLgRNrPXEFGwHtnu
	qj4ZwrMiq1ZbyElxoj0Syw0=
X-Google-Smtp-Source: AGHT+IE0+qbK4VvgA3KDT0+GXzs9Fg/EXiDSu8Q5+V1kXxILxgIqaJO6+KgthkXXeowkAevvVIEbOQ==
X-Received: by 2002:a17:902:d50f:b0:1d3:52ec:fa64 with SMTP id b15-20020a170902d50f00b001d352ecfa64mr923768plg.81.1702500531203;
        Wed, 13 Dec 2023 12:48:51 -0800 (PST)
Received: from [127.0.0.1] ([163.47.54.2])
        by smtp.gmail.com with ESMTPSA id a4-20020a170902ee8400b001d34e4e40ffsm1911161pld.70.2023.12.13.12.48.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Dec 2023 12:48:50 -0800 (PST)
Date: Thu, 14 Dec 2023 07:48:35 +1100
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Biju Das <biju.das.jz@bp.renesas.com>
CC: Support Opensource <support.opensource@diasemi.com>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "biju.das.au" <biju.das.au@gmail.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 2/3] Input: da9063 - Use dev_err_probe()
User-Agent: K-9 Mail for Android
In-Reply-To: <CAMuHMdV6sPuRp3=5T43Ruu2P3mMB5C5w4=QS_GVVxT8GuwRDpA@mail.gmail.com>
References: <20231211165708.161808-1-biju.das.jz@bp.renesas.com> <20231211165708.161808-3-biju.das.jz@bp.renesas.com> <CAMuHMdWEH274CJTpMVY1c7rL0BrpHcjWDp0Acb5evDHotBEzTg@mail.gmail.com> <TYCPR01MB112699325FAC71E81546D258B868EA@TYCPR01MB11269.jpnprd01.prod.outlook.com> <CAMuHMdV6sPuRp3=5T43Ruu2P3mMB5C5w4=QS_GVVxT8GuwRDpA@mail.gmail.com>
Message-ID: <1784A867-E5BA-47BC-AC3C-5B5EAB2A056B@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On December 12, 2023 8:28:45 PM GMT+11:00, Geert Uytterhoeven <geert@linux-=
m68k=2Eorg> wrote:
>Hi Biju,
>
>On Tue, Dec 12, 2023 at 10:03=E2=80=AFAM Biju Das <biju=2Edas=2Ejz@bp=2Er=
enesas=2Ecom> wrote:
>> > From: Geert Uytterhoeven <geert@linux-m68k=2Eorg>
>> > On Mon, Dec 11, 2023 at 5:57=E2=80=AFPM Biju Das <biju=2Edas=2Ejz@bp=
=2Erenesas=2Ecom>
>> > wrote:
>> > > Replace dev_err()->dev_err_probe() to simpilfy probe()=2E
>> > >
>> > > Signed-off-by: Biju Das <biju=2Edas=2Ejz@bp=2Erenesas=2Ecom>
>
>> OK, I will send
>>
>> 1) separate patch for dropping unneeded prints related to OOM
>> 2) A patch for replacing dev_err()->dev_err_probe() + Update error mess=
age for devm_request_threaded_irq()
>> 3) separate patch for dropping print message for input_register_device(=
);
>>
>> Is it ok?
>
>Personally, I'd be fine with just a single "cleanup error printing" patch=
=2E
>But Dmitry has the final say=2E

I'm fine with a single patch unless you feel strongly about splitting it i=
n 2=2E

Thanks=2E=20

--=20
Dmitry

