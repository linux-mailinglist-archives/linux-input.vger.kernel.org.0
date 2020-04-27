Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4DE21BB00B
	for <lists+linux-input@lfdr.de>; Mon, 27 Apr 2020 23:14:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726030AbgD0VO2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 27 Apr 2020 17:14:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:32802 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725919AbgD0VO2 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 27 Apr 2020 17:14:28 -0400
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B01652072D;
        Mon, 27 Apr 2020 21:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588022067;
        bh=3/xQKPat80WwMpp4b/YKGspgFfYco3C9obwmx2YbCNQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=A4QYC84I+KNu02/UbaLFUaIp+1r6mxKLUn/h4eraYXq25FWAkTgrM548PrRsidzS8
         htsRfuwtMXtEaF+cFwx1wU3kMbWV4fKdDLgCK4zIk96zb4bOPkvbT12J3fN1UUIJkT
         MtbkEtLEkeh3xTFSWkpOOm0UkyaauKQYPNdy9HVU=
Received: by mail-qv1-f51.google.com with SMTP id h6so9349535qvz.8;
        Mon, 27 Apr 2020 14:14:27 -0700 (PDT)
X-Gm-Message-State: AGi0Pub1FI0YHs3qkAPKujQIOXUp5epeVUz6M0z8SZLp6lzH4w8TU+qa
        ySM19yvwVW3A0WA+n4pZVdYrmDyGFCCi0I8kUQ==
X-Google-Smtp-Source: APiQypLetSXEqm2QP8meb2C+x5jqYqHHbHekIBOBhptSaU1IYL9s+vGzSpcgM3BadygVFFslwFSjNuduws/i6d1sQkA=
X-Received: by 2002:a05:6214:1848:: with SMTP id d8mr22681188qvy.136.1588022066797;
 Mon, 27 Apr 2020 14:14:26 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1587916846.git.mirq-linux@rere.qmqm.pl> <222105a9c09ac85f0c03224ef7acb8a6d6e237d5.1587916846.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <222105a9c09ac85f0c03224ef7acb8a6d6e237d5.1587916846.git.mirq-linux@rere.qmqm.pl>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 27 Apr 2020 16:14:15 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLtvKgZYeb8xqT1nXa1Xja2Dxr6PBKixD6tN50cZ2xH5g@mail.gmail.com>
Message-ID: <CAL_JsqLtvKgZYeb8xqT1nXa1Xja2Dxr6PBKixD6tN50cZ2xH5g@mail.gmail.com>
Subject: Re: [PATCH v4 10/10] dt-bindings: input: touchscreen: elants_i2c:
 convert to YAML
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     David Heidelberg <david@ixit.cz>,
        Dmitry Osipenko <digetx@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        James Chen <james.chen@emc.com.tw>,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        Scott Liu <scott.liu@emc.com.tw>,
        Linux Input <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Apr 26, 2020 at 11:11 AM Micha=C5=82 Miros=C5=82aw
<mirq-linux@rere.qmqm.pl> wrote:
>
> From: David Heidelberg <david@ixit.cz>
>
> Convert elants_i2c.txt DT binding to YAML and put into correct directory.

Resend to the DT list or this won't be in my review queue. Looks okay
from a quick scan.

Rob
