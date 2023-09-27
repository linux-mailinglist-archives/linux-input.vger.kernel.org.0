Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07F6F7B0969
	for <lists+linux-input@lfdr.de>; Wed, 27 Sep 2023 17:56:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232542AbjI0P4N (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 27 Sep 2023 11:56:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232852AbjI0P4B (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 27 Sep 2023 11:56:01 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 829D6CC4
        for <linux-input@vger.kernel.org>; Wed, 27 Sep 2023 08:55:13 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-534694a9f26so18441a12.1
        for <linux-input@vger.kernel.org>; Wed, 27 Sep 2023 08:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695830112; x=1696434912; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vSrmv8CdZOJwg8Rjk/t0kAfEdW3//3EbfZ/Siaum1BY=;
        b=PhcqdG8dVYekMyhH1c5a8xS7GxblKy5YJ8KCgT0Y6KmHdaEMDVO2op6Lbj00lzsVFv
         F9bjtiEwTONeP5eGfwcW/T1uyTh+47KDyrET32WvVJrJyztquLOXsTdf+nA5wIirIUGW
         D5ktBuM9vjf36yeS5QwMhw1Vul0O0oFVq+r10vSZS6Qv8b0jatN+cYf6ETbPn13yU5FH
         cYiDw7MfFLM+dAxk9grzpFJmmMhx4PmxzJR3wvvz3KROukazbHNEveX/oCiSZ0EKBp/6
         AhwS1e8jluNr5EGZiJ8fPu8T8ZsVYzVRc53jf6nJDHcaA5of48Lxvy2ke6LLS058y0VM
         U0iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695830112; x=1696434912;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vSrmv8CdZOJwg8Rjk/t0kAfEdW3//3EbfZ/Siaum1BY=;
        b=b4aum3rWQ2DxG3/tfQec5kKSsqBU0yOYjYz0FbkCjAtnw2SxGHxMGmxgdaUsJQddcq
         +OJHUi47ghWBS64Y4fevQLQXpHv4WCahP2u6aWvDgg3+MkGrtHDk55Fp3WxJ75id9Vrx
         blXFysgrPZ0zmgtqxjrd5gpZvrsiy28E+epTTQjViNDJrJjazu51TReYkHy6bl3AO9i5
         mNx/YNQFP9aLCZkGX/hMSkxva00kXQ+AOfB5KLUWKUeA05hAy1v7DYSKtmRz2gwTahOZ
         2wkluB12vPxjBhMbgdgf9rBVnMMGPaM+RLMOJa/g2/fAAzU1ruKHpFXPbAjU7FGb59vF
         CGyA==
X-Gm-Message-State: AOJu0YwCJUXJDDAorfgjtwm3JUZrjSZ6cbGL9nlKVBmaSNlHz3u8gBgF
        R8046FXXICaVQZQv4qOxlpFe51hoRuYh9fujdCPrzgE4pUkPDptSNtEt5qkOrZU=
X-Google-Smtp-Source: AGHT+IH0RKGEqZ50b13IkHIPc4aRaJwDAkjl9e3uG8Mv6eJajLiyCcSvo5RAHFMmzFLDsmR8oJbDoGjAv+5jxCncXkI=
X-Received: by 2002:a50:9fef:0:b0:525:573c:6444 with SMTP id
 c102-20020a509fef000000b00525573c6444mr266714edf.1.1695830111711; Wed, 27 Sep
 2023 08:55:11 -0700 (PDT)
MIME-Version: 1.0
References: <ca0109fa-c64b-43c1-a651-75b294d750a1@leemhuis.info> <CAAzPG9NkoaUz_JRtZt_JomsYj-8ZPn4QH0w0eeR-oxd55-18Qg@mail.gmail.com>
In-Reply-To: <CAAzPG9NkoaUz_JRtZt_JomsYj-8ZPn4QH0w0eeR-oxd55-18Qg@mail.gmail.com>
From:   Jeffery Miller <jefferymiller@google.com>
Date:   Wed, 27 Sep 2023 10:55:00 -0500
Message-ID: <CAAzPG9NWp8yPU52o7d2-jLjxjLodFOiE_AjoxmCAZ=MXtV__Aw@mail.gmail.com>
Subject: Re: [regression] Resume broken on T14s Gen1 (AMD) due to "Input:
 psmouse - add delay when deactivating for SMBus mode"
To:     Thorsten Leemhuis <linux@leemhuis.info>
Cc:     Andrew Duggan <aduggan@synaptics.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linux kernel regressions list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Thorsten,

On Wed, Sep 27, 2023 at 10:43=E2=80=AFAM Jeffery Miller
<jefferymiller@google.com> wrote:
>
>
> On Wed, Sep 27, 2023 at 3:54=E2=80=AFAM Thorsten Leemhuis <linux@leemhuis=
.info> wrote:
>>
>> My dmesg from a kernel with the revert:
>> https://www.leemhuis.info/files/misc/dmesg
>>
> In this dmesg output it shows that this is an elantech smbus device:
> ```
> [    4.260415] psmouse serio1: elantech: assuming hardware version 4 (wit=
h firmware version 0x7f3001)
> [    4.279297] psmouse serio1: elantech: Synaptics capabilities query res=
ult 0x90, 0x18, 0x0f.
> [    4.292788] psmouse serio1: elantech: Elan sample query result 00, 80,=
 c9
> [    4.319184] psmouse serio1: elantech: Elan ic body: 0x10, current fw v=
ersion: 0x3
> ...
> [    4.346951] psmouse serio1: elantech: Trying to set up SMBus access
> [    4.346986] psmouse serio1: elantech: SMbus companion is not ready yet
> [    4.369993] input: ETPS/2 Elantech TrackPoint as /devices/platform/i80=
42/serio1/input/input7
> [    4.376200] systemd[1]: bpf-lsm: LSM BPF program attached
> [    4.385192] input: ETPS/2 Elantech Touchpad as /devices/platform/i8042=
/serio1/input/input5
> ```
> The change in 92e24e0e57f72e shouldn't affect the elantouch device as  el=
antech_setup_smbus
> initializes `psmouse_smbus_init` with need_deactivate =3D false.
>
> Did you store dmesg logs from boot without the applied patch?

I intended to ask if you have logs from a boot without 92e24e0e57f72e rever=
ted.

> If the delay was being applied the timestamps should show the 30ms delay =
between
> `psmouse serio1: elantech: Trying to set up SMBus access`
> and
> `psmouse serio1: elantech: SMbus companion is not ready yet`
>

Thank You,
Jeff
