Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCF2474CC1F
	for <lists+linux-input@lfdr.de>; Mon, 10 Jul 2023 07:21:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231163AbjGJFVg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 Jul 2023 01:21:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229659AbjGJFVO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 Jul 2023 01:21:14 -0400
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11DAE35BE
        for <linux-input@vger.kernel.org>; Sun,  9 Jul 2023 22:16:11 -0700 (PDT)
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 489A63F235
        for <linux-input@vger.kernel.org>; Mon, 10 Jul 2023 05:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1688966170;
        bh=tnBWz3PKopY+XT6Jb3lHhGQnZfW7IudoUFXB+bkBQeU=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=D3D1sR/z+UbrfGhtSHvxWTj8ojbY1pzyF/+fT3lQ1IaExXrchkJe3zMsOE4NzW2mL
         lsnjExpMtWfJYeiNL2BEE+c40DnCUxuJQtbPcJTn/I/sKMgB2JsoUoCijGVdPPmWh/
         V8acbtNMfSif9kjuvIL7xUjKTRsHixskjvdeWc4ym5GEISuhIYghpi56xLgouJOW8P
         Ft0tDNfsobQRKNdmu0hgBgQAJ4zgpJq6nA2M69fb7qg4LzbMB9gsu1H17NnLXwgSj4
         9ZaYmFF/5mTRA0e74P9EEXFMRA7w7cBOMF7zv4C2NgT31eWv6Fo3nX/NEtxLp5lXoW
         dWqdVRDsPV9Ew==
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-53b9eb7bda0so4867439a12.0
        for <linux-input@vger.kernel.org>; Sun, 09 Jul 2023 22:16:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688966168; x=1691558168;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tnBWz3PKopY+XT6Jb3lHhGQnZfW7IudoUFXB+bkBQeU=;
        b=dEQP0TcxDBVpGZ2LmRn5bpy4iPpVWteudt0FPz23g93or3zYEPi9k//5nuQxh2PQgf
         zStCjfmS+nECrl9ngHs+u8ZV4zS4ScxvtxiIosE7fRblYozKRcP0GPUQ7uQz+cBvyGS6
         RbxJgZV3EtYSxIqHWE7G9avu2oMPXQynAan9Z/MJYyKC1V9jZxi7lrG+h0rA+WhhEHCo
         AvfzdbqNB44HYMGuYhDGnoqtLeHcYh2Kc+KL89pr6i32QuGd1xTPp9hwJqiE00lhyVzl
         bfio27oKROGTkjzx8Xe1duKTqz9O0hiqCAyaof2eibwsfCT/d42BNtqrLOa5DncvwEeU
         OX7A==
X-Gm-Message-State: ABy/qLY6tPRM7Ro13GpSoFkbx+/qIhH+xDnbESq3jjK+bw33cOQ2aH+2
        Ue7BzYo+rvM0xlcgN0kt8TaxP5TNOloRFb5kTsaWtZe/d6DdcEjk4/IcBqypxtzKmT7iBh70pIC
        9NEDfvSaORVFaLoMCZ8SJeSSe+Az+wsek4HoMrOL6FweSuvUhDcY9QtBy
X-Received: by 2002:a17:90a:43a5:b0:262:fe45:85f6 with SMTP id r34-20020a17090a43a500b00262fe4585f6mr9227659pjg.0.1688966168340;
        Sun, 09 Jul 2023 22:16:08 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGSMLHwotmQ8GE5O1nopccY+DvEwRjbUnvLHA7doxHeLVdJEYqh9Gx3xkpJW3kQM90q3vX5ImT8ci/ACEWrrzk=
X-Received: by 2002:a17:90a:43a5:b0:262:fe45:85f6 with SMTP id
 r34-20020a17090a43a500b00262fe4585f6mr9227656pjg.0.1688966167982; Sun, 09 Jul
 2023 22:16:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230704081724.2308195-1-kai.heng.feng@canonical.com> <29b68182-cb58-6a3f-0fdf-b919851e5524@amd.com>
In-Reply-To: <29b68182-cb58-6a3f-0fdf-b919851e5524@amd.com>
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
Date:   Mon, 10 Jul 2023 13:15:56 +0800
Message-ID: <CAAd53p7-Cyqt-aGkzDNu2sqWejJQgbLcs8BBQvOZxj-FfHmo2g@mail.gmail.com>
Subject: Re: [PATCH] HID: amd_sfh: Increase bitwidth to avoid shift-out-of-bounds
To:     Basavaraj Natikar <bnatikar@amd.com>
Cc:     basavaraj.natikar@amd.com, mario.limonciello@amd.com,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Basavaraj,

On Fri, Jul 7, 2023 at 3:36=E2=80=AFPM Basavaraj Natikar <bnatikar@amd.com>=
 wrote:
>
>
> On 7/4/2023 1:47 PM, Kai-Heng Feng wrote:
> > UBSAN complains shift-out-of-bounds on amd_sfh:
> > [    7.593412] input: SYNA3105:00 06CB:CEA3 Mouse as /devices/platform/=
AMDI0010:00/i2c-0/i2c-SYNA3105:00/0018:06CB:CEA3.0001/input/input11
> > [    7.593541] input: SYNA3105:00 06CB:CEA3 Touchpad as /devices/platfo=
rm/AMDI0010:00/i2c-0/i2c-SYNA3105:00/0018:06CB:CEA3.0001/input/input12
> > [    7.593625] hid-multitouch 0018:06CB:CEA3.0001: input,hidraw0: I2C H=
ID v1.00 Mouse [SYNA3105:00 06CB:CEA3] on i2c-SYNA3105:00
> > [    7.664537] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > [    7.664540] UBSAN: shift-out-of-bounds in drivers/hid/amd-sfh-hid/sf=
h1_1/amd_sfh_desc.c:149:50
> > [    7.664544] shift exponent 103 is too large for 64-bit type 'long un=
signed int'
> > [    7.664547] CPU: 5 PID: 124 Comm: kworker/5:1 Tainted: G        W   =
       6.4.0-next-20230703 #1
> > [    7.664549] Hardware name: HP HP EliteBook 835 13 inch G10 Notebook =
PC/8C10, BIOS V83 Ver. 01.01.09 06/05/2023
> > [    7.664551] Workqueue: events amd_sfh_work_buffer [amd_sfh]
> > [    7.664562] Call Trace:
> > [    7.664564]  <TASK>
> > [    7.664567]  dump_stack_lvl+0x48/0x70
> > [    7.664576]  dump_stack+0x10/0x20
> > [    7.664578]  __ubsan_handle_shift_out_of_bounds+0x156/0x310
> > [    7.664584]  ? sched_clock_noinstr+0x9/0x10
> > [    7.664589]  ? sched_clock_cpu+0x12/0x1d0
> > [    7.664594]  ? raw_spin_rq_lock_nested+0x1e/0xa0
> > [    7.664597]  ? psi_group_change+0x237/0x520
> > [    7.664600]  float_to_int.cold+0x18/0xcf [amd_sfh]
> > [    7.664606]  ? __pfx_get_input_rep+0x10/0x10 [amd_sfh]
> > [    7.664611]  get_input_rep+0x241/0x340 [amd_sfh]
> > [    7.664617]  amd_sfh_work_buffer+0x91/0x190 [amd_sfh]
> > [    7.664622]  process_one_work+0x229/0x450
> > [    7.664627]  worker_thread+0x50/0x3f0
> > [    7.664629]  ? __pfx_worker_thread+0x10/0x10
> > [    7.664632]  kthread+0xf4/0x130
> > [    7.664635]  ? __pfx_kthread+0x10/0x10
> > [    7.664638]  ret_from_fork+0x29/0x50
> > [    7.664644]  </TASK>
> > [    7.664652] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > So increase the variable bitwidth to solve the issue.
> >
> > Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> > ---
> >  drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c b/drivers/hi=
d/amd-sfh-hid/sfh1_1/amd_sfh_desc.c
> > index 6f0d332ccf51..550639ef8bfe 100644
> > --- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c
> > +++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c
> > @@ -134,7 +134,8 @@ static void get_common_inputs(struct common_input_p=
roperty *common, int report_i
> >
> >  static int float_to_int(u32 float32)
> >  {
> > -     int fraction, shift, mantissa, sign, exp, zeropre;
> > +     int fraction, shift, sign, exp, zeropre;
> > +     s128 mantissa;
> >
> >       mantissa =3D float32 & GENMASK(22, 0);
> >       sign =3D (float32 & BIT(31)) ? -1 : 1;
>
> Could you please check below patch which covers more scenario's and corne=
r cases
> for UBSAN: shift-out-of-bounds.
> https://lore.kernel.org/all/20230707065722.9036-1-Basavaraj.Natikar@amd.c=
om/T/#m67e0b7aa6a288ea074b3bfa61e7f085f7e036172

Thanks for the patch. Please add my tag:
Tested-by: Kai-Heng Feng <kai.heng.feng@canonical.com>

>
> Thanks,
> --
> Basavaraj
>
