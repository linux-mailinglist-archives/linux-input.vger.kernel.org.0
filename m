Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7893D1A1E66
	for <lists+linux-input@lfdr.de>; Wed,  8 Apr 2020 11:58:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728072AbgDHJ60 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 8 Apr 2020 05:58:26 -0400
Received: from mail-ua1-f65.google.com ([209.85.222.65]:33881 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728070AbgDHJ60 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 8 Apr 2020 05:58:26 -0400
Received: by mail-ua1-f65.google.com with SMTP id d23so2460538uak.1
        for <linux-input@vger.kernel.org>; Wed, 08 Apr 2020 02:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/KSnT58fVHI1rOGU8uuODx+6ELq/Ks+s8czTqOysk1Y=;
        b=idsfVbcSavH8tGrA4MfiXmKww0CsIpBTJUqXsUvwHvQVz0+HoeKj6cPN2ieKqe2gQc
         dwooqy54GGu61bQmOIEkPFGPkpQ3dmQmZ0BHwF20yfQ3UoNi1Hj7K3nZncRQEdgkGco/
         pgrJeUmnkP5bwlStZbSluZs82+feHEDiEQJNY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/KSnT58fVHI1rOGU8uuODx+6ELq/Ks+s8czTqOysk1Y=;
        b=BPBRCVRPGuefEhuUtgh+esU4ObzqGRgUJ9bpReuIDVibCLobE/iFCpK68aXGAmYYdx
         zAkWVhdXJnRaQ0hc0MhE/1QvK4HchshjeWTR/Z1epKOn712uNXxzEByxXGd9bJt/wVR4
         FgCyI44n9ku0QmgUpRHRAy9iZwaKlr5j038zQmpPAbWKeX75yetU0gyGbfgoUw3bdCcl
         8fFG8vjVe0cyspa7FqJPa/eG77BddvNp9XXP+lZLbVGpNd11cm+MErzh92XuOaEZTDeh
         f2nedQxfypNE26taWqP30kvJW/VrnQfIzwmMQ7ku39VTxzO2gYDRiL0xkcPczkdVriVN
         btCg==
X-Gm-Message-State: AGi0PuaIDz5ERFtrbeqDL2qiA/0iWIkj0343Q/GWF2BK9J9LVSeP5dzo
        GKcFMr4Mh7Jg4Vm46ny5iwQhPVh2ORHBO++ZXa4g9Q==
X-Google-Smtp-Source: APiQypINgJUBTWurvd0z/FyqSrVEEyqzKKMfEgLm9GQm6RsQwA7GMWLXsLhoKGa12Tt2GpHRkBpQN4mRrXzRk+HFw9w=
X-Received: by 2002:ab0:158b:: with SMTP id i11mr4975462uae.123.1586339905116;
 Wed, 08 Apr 2020 02:58:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200306085513.76024-1-ikjn@chromium.org> <20200312192023.GA19701@bogus>
In-Reply-To: <20200312192023.GA19701@bogus>
From:   Ikjoon Jang <ikjn@chromium.org>
Date:   Wed, 8 Apr 2020 17:58:14 +0800
Message-ID: <CAATdQgBFMbLLwkntKu6dgU1S0DAxx9yTffh0ERac6CM90-G0bA@mail.gmail.com>
Subject: Re: [PATCH v7] dt-bindings: mfd: Convert ChromeOS EC bindings to json-schema
To:     Rob Herring <robh@kernel.org>, Lee Jones <lee.jones@linaro.org>
Cc:     devicetree@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Nicolas Boitchat <drinkcat@chromium.org>,
        linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Mar 13, 2020 at 3:20 AM Rob Herring <robh@kernel.org> wrote:
>
> On Fri,  6 Mar 2020 16:55:13 +0800, Ikjoon Jang wrote:
> > Convert the ChromeOS EC bindings to json-schema.
> >
> > Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
> > Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> > ---
> >  .../devicetree/bindings/mfd/cros-ec.txt       |  76 -----------
> >  .../bindings/mfd/google,cros-ec.yaml          | 129 ++++++++++++++++++
> >  2 files changed, 129 insertions(+), 76 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/mfd/cros-ec.txt
> >  create mode 100644 Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
> >
>
> Reviewed-by: Rob Herring <robh@kernel.org>

This patch should go through Lee Jones tree?
