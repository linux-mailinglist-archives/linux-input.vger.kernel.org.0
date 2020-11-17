Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A30E2B57F3
	for <lists+linux-input@lfdr.de>; Tue, 17 Nov 2020 04:36:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726591AbgKQDfH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 16 Nov 2020 22:35:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726503AbgKQDfH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 16 Nov 2020 22:35:07 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5AD7C0613CF;
        Mon, 16 Nov 2020 19:35:05 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id w24so1884593wmi.0;
        Mon, 16 Nov 2020 19:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VDboQmgyjLAX52xymUAu+8xSc/wlXdquqvvYv+AI8ZI=;
        b=R2UsKu/+ZXJ7ubFdvoPnecjI5wYX7RTMs7CVoRZxkq8ACexdUMcAEa7h3QkEa1KD9L
         eB1kqFUpHWszjCHWFXoujW1VzMVcA3ohMiVktMylTkTFrCgOjwrtOLQmSi/LHMfQPq04
         VtE3GhalkfhjDyFpk7hDIuYmxbE7yyt2IeJd1YtW0F9Pg3F/4KX+CN4bQb0B1Ql3JVFX
         Z+u1XfCUbnzFQXzghC+TgVBW/VZll0I9oC+2tsyIMkuixtoFgJEs5ktYLJdFRjfHfKiB
         QrZTp2e95YbuJwuhdop1qp6LOEgYleKsZDih0KU0M+0Ddar7lDZrEBnXY6gE4bMlz9s3
         yEGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VDboQmgyjLAX52xymUAu+8xSc/wlXdquqvvYv+AI8ZI=;
        b=VO3eHbR5pmyqvFBwkEI5GY/VmQRqt9DP4S/TJFhEEWZckr0haFP0+qxG1SfJow9odk
         SceLXJhe1i9UvrJcZN4iUxpxzS1XT79cNEhZX0d0qe0cCpfuzsNngxJrLWcn/GSCQzTj
         rlODzk+iSuW4J4dHAHsguTi+WCNuILi36HC8HfeLm27FyOa9jSBCERsjWCBshpBVHHT3
         voCZXTBnbd6leDWB0fNb4Cel2OGoTkPG+NP8bpEGeAaUI6B3z/V1aiBHupoBE5/oe5Hx
         6z80ElBfVgPzhE3RWcmlVdrIid6RckUsW+JEpQHY6fQZKeXIHhQMHRZw6mIaNQ+I+o7m
         UxJw==
X-Gm-Message-State: AOAM533pg8ZLZwZ938YCGRY0Bd0ZEzOX5jFyr37sl8KF9N05XyKeeQz8
        LcMHGpyY9h03St6qL7pVDPNGYRieuuALrlpnrK8zg04tVEAYmw==
X-Google-Smtp-Source: ABdhPJyGvmqtYih5lEdg6I72hpi+LwY6R9zYoolfKtGq6HyOBpf8ZZJN+OWgahTXePGQHBv31BGAEcOOarjT92f+lFE=
X-Received: by 2002:a1c:b387:: with SMTP id c129mr1959876wmf.58.1605584104606;
 Mon, 16 Nov 2020 19:35:04 -0800 (PST)
MIME-Version: 1.0
References: <20201113113451.52355-1-zhang.lyra@gmail.com> <20201113113451.52355-2-zhang.lyra@gmail.com>
 <20201116145444.GA1635499@bogus>
In-Reply-To: <20201116145444.GA1635499@bogus>
From:   Chunyan Zhang <zhang.lyra@gmail.com>
Date:   Tue, 17 Nov 2020 11:34:28 +0800
Message-ID: <CAAfSe-tgX=ajiUeZ+4Kp5HG95OUJz573Fj9pw2suLqQp89AeRg@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: input: Convert sc27xx-vibra.txt to json-schema
To:     Rob Herring <robh@kernel.org>
Cc:     Orson Zhai <orsonzhai@gmail.com>, linux-input@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Chunyan Zhang <chunyan.zhang@unisoc.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        DTML <devicetree@vger.kernel.org>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Nemo Han <nemo.han@unisoc.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 16 Nov 2020 at 22:54, Rob Herring <robh@kernel.org> wrote:
>
> On Fri, 13 Nov 2020 19:34:50 +0800, Chunyan Zhang wrote:
> > From: Chunyan Zhang <chunyan.zhang@unisoc.com>
> >
> > Convert the sprd sc27xx vibrator binding to DT schema using json-schema.
> >
> > Signed-off-by: Chunyan Zhang <chunyan.zhang@unisoc.com>
> > ---
> >  .../bindings/input/sprd,sc27xx-vibra.txt      | 23 ----------
> >  .../bindings/input/sprd,sc27xx-vibrator.yaml  | 44 +++++++++++++++++++
> >  2 files changed, 44 insertions(+), 23 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/input/sprd,sc27xx-vibra.txt
> >  create mode 100644 Documentation/devicetree/bindings/input/sprd,sc27xx-vibrator.yaml
> >
>
>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/input/sprd,sc27xx-vibrator.yaml: 'additionalProperties' is a required property
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/input/sprd,sc27xx-vibrator.yaml: ignoring, error in schema:
> warning: no schema found in file: ./Documentation/devicetree/bindings/input/sprd,sc27xx-vibrator.yaml
>
>
> See https://patchwork.ozlabs.org/patch/1399724
>
> The base for the patch is generally the last rc1. Any dependencies

When trying to reproduce the error, I found there's an error on rc1
along with a lot of unrelated warnings, but rc2 is good.

$ make -k dt_binding_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/input/sprd,sc27xx-vibrator.yaml
  LINT    Documentation/devicetree/bindings

[snip...]

make[1]: *** [Documentation/devicetree/bindings/Makefile:59:
Documentation/devicetree/bindings/processed-schema-examples.json]
Error 123
  DTEX    Documentation/devicetree/bindings/input/sprd,sc27xx-vibrator.example.dts
make[1]: Target '__build' not remade because of errors.
make: *** [Makefile:1364: dt_binding_check] Error 2

> should be noted.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit.

Ok, thanks for pointing this out.

Chunyan
