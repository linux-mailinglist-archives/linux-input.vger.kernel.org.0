Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6889C38F449
	for <lists+linux-input@lfdr.de>; Mon, 24 May 2021 22:22:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233145AbhEXUYX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 24 May 2021 16:24:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232900AbhEXUYW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 24 May 2021 16:24:22 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEC99C061574;
        Mon, 24 May 2021 13:22:52 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id v5so35236825ljg.12;
        Mon, 24 May 2021 13:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zmHgGUSHIFychmCNai/HQ+GoGaggXlD85UtIJX00PFc=;
        b=Kb7gxfEkLnJ4LcVqhu8XP+yp6DtPdbRfpHSVPF/xHbPVFjv02JFHruTdQpBgMbCnbc
         vGG/a5U0D1XtTfAcqWyizBF4Bo4vmCykXZnpFdodTi/G9fytL+5XW+3pHMTea+pbmjH+
         V1xpouMge0PWuCf8N7zs4e140Tc4me5Mc4f2lZDA5VemCasn8g/ssqUoI7LBe8XScwtA
         Re/wZZ/LfjFHL3zFORFQdWLHkxLfspAVzqPMke0UYOLTlYh8fD48KcceSgGidRrBV9m3
         dbFrxWR5QuCl75zYRLhATtxGwSZQwkBlZBWPnIpcMorGgUQou1p9gDp3zWISVuZsx8lx
         ggtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zmHgGUSHIFychmCNai/HQ+GoGaggXlD85UtIJX00PFc=;
        b=JLvk0UNOVtCKPgnVdpBo/r06fhftKggNxCIukkgbpgi7Ui25TfuQ3OPV17OIcBS9Zb
         L+KOv3UcP6nJv47IVPf6yZGXOTyQCAesu61GKofgN4GitQ9gU0BWX9n3VZdTFkaMvc3z
         pQvaYTulWlBEWv5Plw9Y37UqbJtIfMsBf3Ld7cCzejlEamDL5AApUXj7zeG+MPah2/GQ
         F60AkTYXotkvvH2sI8H5IThkMcUhgRvJhEbTS/lT+qNhJgqUhHB/Nb43BuQO+b00EHDo
         m+M3g4uWdpzzewV43e2e1nC7+kACnRSwS++AZgmjqLaMhgDxdrw7xU9gWgF5Ga6/nDDK
         g5bA==
X-Gm-Message-State: AOAM533jYy7aBuG+YFiT8VEiObGG8+vkZZkar6pXf+LhG4KK7gyQ6LKG
        heZXCCg7LyRhiDyIoTFdD+MJ+iDHQzp0SALLilLOLkGmK3U=
X-Google-Smtp-Source: ABdhPJyNHlSOR+gyDfs4Vr3xW8JgoI41JuEisXLMFVRjIhUBIekPUrSm24R6828nDLAhNoGSpoam+h4k9zm1sFqUsIU=
X-Received: by 2002:a2e:824c:: with SMTP id j12mr18140721ljh.490.1621887771087;
 Mon, 24 May 2021 13:22:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210521192210.12839-1-clabbe@baylibre.com>
In-Reply-To: <20210521192210.12839-1-clabbe@baylibre.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Mon, 24 May 2021 17:22:39 -0300
Message-ID: <CAOMZO5BRUF5aHC32zp0+iKWLtVN87-zjOgHhj2p7AOqorOEwGg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: input: remove fsl-mma8450 which is handled
 by trivial-devices
To:     Corentin Labbe <clabbe@baylibre.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, linux-input@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Fabio Estevam <fabio.estevam@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, May 21, 2021 at 5:27 PM Corentin Labbe <clabbe@baylibre.com> wrote:
>
> trivial-devices.yaml already provide bindings for fsl-mma8450.
> Since input/fsl-mma8450.txt provides no extra value, lets remove it.
>
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
