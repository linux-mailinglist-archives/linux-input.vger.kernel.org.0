Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFD01CBBBD
	for <lists+linux-input@lfdr.de>; Fri,  4 Oct 2019 15:33:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388669AbfJDNdH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 4 Oct 2019 09:33:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:43412 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388654AbfJDNdH (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 4 Oct 2019 09:33:07 -0400
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EE04C222C2;
        Fri,  4 Oct 2019 13:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570195986;
        bh=bmDRvBtZ//Z1OJ+9OeeRi1LyxMkGRLlVXYnDKD4c1bM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=QBlwBZlMJrI9nOPsxFqz4+IRxKTvOqWeYZpTf5XgrGQTBJ+radjsrBLwfwodgZFHI
         El+kdp7wR6XCIBc/A0i3FRVZqzEnr5kCw3Ab0bX+rdnmjAPpaf0DiRNP8XkXMqukUl
         HVpy0a4Hb15g+RTFfeTYcu5bNolxEUoejKJPdeY8=
Received: by mail-qt1-f182.google.com with SMTP id o12so8563785qtf.3;
        Fri, 04 Oct 2019 06:33:05 -0700 (PDT)
X-Gm-Message-State: APjAAAXzDxwYS2JxcaQBQ4+bebQfQuS8v08DKCIATOVyQPA+/Gsw0Rzg
        9r3TQXCAdxVTQI7LgNe2bgNO7UBSux+h6xWWDQ==
X-Google-Smtp-Source: APXvYqyZqg0ojFsRNWqARY0z+z0W0gJ+AtVgT8GsWMZt48VBOYLQCkl6etWJrCiqcKpRPjTKtqujLVfrAehyLnZKid0=
X-Received: by 2002:ac8:75c7:: with SMTP id z7mr1290160qtq.136.1570195985110;
 Fri, 04 Oct 2019 06:33:05 -0700 (PDT)
MIME-Version: 1.0
References: <1569940180-11417-1-git-send-email-michal.vokac@ysoft.com>
 <1569940180-11417-3-git-send-email-michal.vokac@ysoft.com>
 <CAL_Jsq+DTyVKn4je=_kARoo43wr_fhyxXUEZWEDhHDZ2pDiqPQ@mail.gmail.com> <44000610-75bb-7243-8ca3-411832745817@ysoft.com>
In-Reply-To: <44000610-75bb-7243-8ca3-411832745817@ysoft.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 4 Oct 2019 08:32:52 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLAYpRvXLYaMonr=jVkX2-Lq9fWzJQrzFfn6q4MO8M8dA@mail.gmail.com>
Message-ID: <CAL_JsqLAYpRvXLYaMonr=jVkX2-Lq9fWzJQrzFfn6q4MO8M8dA@mail.gmail.com>
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

On Fri, Oct 4, 2019 at 2:40 AM Michal Vok=C3=A1=C4=8D <michal.vokac@ysoft.c=
om> wrote:
>
> On 03. 10. 19 21:09, Rob Herring wrote:
> > On Tue, Oct 1, 2019 at 9:29 AM Michal Vok=C3=A1=C4=8D <michal.vokac@yso=
ft.com> wrote:
> >>
> >> Convert the mpr121 binding to DT schema format using json-schema.
> >>
> >> Signed-off-by: Michal Vok=C3=A1=C4=8D <michal.vokac@ysoft.com>
> >> ---
> >> Changes since v1:
> >>   - Extract the common input properties into the input.yaml schema.
> >>   - Fix the wakeup-source description.
> >>   - Fix the example to pass validation. Put the mpr121 device sub-node
> >>     into a i2c {} node.
> >>
> >> Rob, the linux,keycodes property is not valid as it is.
> >> If I put the minItems and maxItems into the common schema, it is valid
> >> and the min/max length check works fine. What could be wrong?
> >>
> >> The error is not very specific..
> >
> > That's a side effect of an 'allOf' somewhere in the meta-schema.
> >
> >> $ make dt_binding_check DT_SCHEMA_FILES=3DDocumentation/devicetree/bin=
dings/input/fsl,mpr121-touchkey.yaml
> >>    SCHEMA  Documentation/devicetree/bindings/processed-schema.yaml
> >> /home/vokac/development/sources/linux-fslc/Documentation/devicetree/bi=
ndings/input/fsl,mpr121-touchkey.yaml: ignoring, error in schema 'linux,key=
codes'
> >> warning: no schema found in file: /home/vokac/development/sources/linu=
x-fslc/Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml
> >> /home/vokac/development/sources/linux-fslc/Documentation/devicetree/bi=
ndings/Makefile:33: recipe for target 'Documentation/devicetree/bindings/pr=
ocessed-schema.yaml' failed
> >> make[3]: *** [Documentation/devicetree/bindings/processed-schema.yaml]=
 Error 255
> >> /home/vokac/development/sources/linux-fslc/Makefile:1264: recipe for t=
arget 'dt_binding_check' failed
> >
> > I'm working on a fix for this. It's a problem in the meta-schema.
>
> OK, thanks a lot!

I've committed an update to the meta-schema. Please update dtschema
and it should work for you.

Rob
