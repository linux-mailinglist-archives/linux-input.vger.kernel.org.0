Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DF97CAEEC
	for <lists+linux-input@lfdr.de>; Thu,  3 Oct 2019 21:09:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733117AbfJCTJR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 3 Oct 2019 15:09:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:44944 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732733AbfJCTJQ (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 3 Oct 2019 15:09:16 -0400
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EE9AE20873;
        Thu,  3 Oct 2019 19:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570129756;
        bh=QaUqOQkklGyOJt3/io5lfJhDA1HfbNMhCHw/YbePA3Y=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=J1EFKsPmsePSImNzI8AU554MEHkdswPSBGhhHxtzf82+hqfXLTpths/oc2+oj2Zr8
         1MG4aaTXr1xd19DjHi5f75uGql4jEy6jzxDQa1bhI6/8vyfP7h/msWyxeRwOD4g8i4
         0WQuqh9izXN1APhUjDS00n4bO/IpicVsm0S4QdbE=
Received: by mail-qt1-f176.google.com with SMTP id d16so5126071qtq.8;
        Thu, 03 Oct 2019 12:09:15 -0700 (PDT)
X-Gm-Message-State: APjAAAUgnd+n+Ma/Bcke2rR+gHsBg5IIZHlYErS0DRX3SDLD92MlDFN+
        XIr0iGyJDSi6ZAthRM29K4S8apYgY9Cv0cjgFg==
X-Google-Smtp-Source: APXvYqzYSTAlmCSpYjqlNHQs9WnfSLdExMcfSEm1Q74Hxz3ykcLryTDbaGVPIfbdwc0/ZD8W0uFvsuoKhNpA8x3Mzco=
X-Received: by 2002:a0c:9792:: with SMTP id l18mr9903736qvd.79.1570129755092;
 Thu, 03 Oct 2019 12:09:15 -0700 (PDT)
MIME-Version: 1.0
References: <1569940180-11417-1-git-send-email-michal.vokac@ysoft.com> <1569940180-11417-3-git-send-email-michal.vokac@ysoft.com>
In-Reply-To: <1569940180-11417-3-git-send-email-michal.vokac@ysoft.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Thu, 3 Oct 2019 14:09:03 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+DTyVKn4je=_kARoo43wr_fhyxXUEZWEDhHDZ2pDiqPQ@mail.gmail.com>
Message-ID: <CAL_Jsq+DTyVKn4je=_kARoo43wr_fhyxXUEZWEDhHDZ2pDiqPQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] dt-bindings: input: Convert mpr121 binding to json-schema
To:     =?UTF-8?B?TWljaGFsIFZva8OhxI0=?= <michal.vokac@ysoft.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Linux Input <linux-input@vger.kernel.org>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Oct 1, 2019 at 9:29 AM Michal Vok=C3=A1=C4=8D <michal.vokac@ysoft.c=
om> wrote:
>
> Convert the mpr121 binding to DT schema format using json-schema.
>
> Signed-off-by: Michal Vok=C3=A1=C4=8D <michal.vokac@ysoft.com>
> ---
> Changes since v1:
>  - Extract the common input properties into the input.yaml schema.
>  - Fix the wakeup-source description.
>  - Fix the example to pass validation. Put the mpr121 device sub-node
>    into a i2c {} node.
>
> Rob, the linux,keycodes property is not valid as it is.
> If I put the minItems and maxItems into the common schema, it is valid
> and the min/max length check works fine. What could be wrong?
>
> The error is not very specific..

That's a side effect of an 'allOf' somewhere in the meta-schema.

> $ make dt_binding_check DT_SCHEMA_FILES=3DDocumentation/devicetree/bindin=
gs/input/fsl,mpr121-touchkey.yaml
>   SCHEMA  Documentation/devicetree/bindings/processed-schema.yaml
> /home/vokac/development/sources/linux-fslc/Documentation/devicetree/bindi=
ngs/input/fsl,mpr121-touchkey.yaml: ignoring, error in schema 'linux,keycod=
es'
> warning: no schema found in file: /home/vokac/development/sources/linux-f=
slc/Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml
> /home/vokac/development/sources/linux-fslc/Documentation/devicetree/bindi=
ngs/Makefile:33: recipe for target 'Documentation/devicetree/bindings/proce=
ssed-schema.yaml' failed
> make[3]: *** [Documentation/devicetree/bindings/processed-schema.yaml] Er=
ror 255
> /home/vokac/development/sources/linux-fslc/Makefile:1264: recipe for targ=
et 'dt_binding_check' failed

I'm working on a fix for this. It's a problem in the meta-schema.

Rob
