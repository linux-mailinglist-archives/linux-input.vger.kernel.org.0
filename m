Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86923123D9C
	for <lists+linux-input@lfdr.de>; Wed, 18 Dec 2019 04:00:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726556AbfLRDAO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Dec 2019 22:00:14 -0500
Received: from mail.kernel.org ([198.145.29.99]:57860 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726496AbfLRDAN (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Dec 2019 22:00:13 -0500
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 05444206EE;
        Wed, 18 Dec 2019 03:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576638013;
        bh=zCZ5t+A+aocu4tNsjCXIjMwGeoHEPiR86NvFEH3f7uI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ca3h/s4dHRpbtNRoFK2S672Ef1JN6NuTSom6NafaK84YWYGXO3tsq/f6yiucGqvwz
         uabPkqa+Jowd5F/VvKTi9673opu/DWf/KWmKESOBTv5DDV6kA32cGlqijKkeYdXfX5
         jehZWom2KUEwVgGZ2YnICTr9msMgdFJ+9t6hBhd8=
Received: by mail-wr1-f52.google.com with SMTP id d16so595171wre.10;
        Tue, 17 Dec 2019 19:00:12 -0800 (PST)
X-Gm-Message-State: APjAAAXAhQ1IyTTEEnrWxZsCKL4nd59kee6tUry/QZp7SjhRzxx5BjDm
        vnzxX7mQxTW3aWhUfAvKLhyqOSicQgb/zotJRTk=
X-Google-Smtp-Source: APXvYqzelVsGJ9gxnjciMwKGywJpn+VuRE2Ym7JXEeVEcs84fhq09inSTSV5A9/1auSZBt+yemX78dkx3SoTqfFbqQk=
X-Received: by 2002:adf:ef4e:: with SMTP id c14mr1261417wrp.142.1576638011575;
 Tue, 17 Dec 2019 19:00:11 -0800 (PST)
MIME-Version: 1.0
References: <20191217152541.2167080-1-ben.dooks@codethink.co.uk>
In-Reply-To: <20191217152541.2167080-1-ben.dooks@codethink.co.uk>
From:   Chen-Yu Tsai <wens@kernel.org>
Date:   Wed, 18 Dec 2019 11:00:00 +0800
X-Gmail-Original-Message-ID: <CAGb2v67ADBH+JtsA9d4Rc84uMjvPXPB4JG2DdVaU+m3C4CGu7g@mail.gmail.com>
Message-ID: <CAGb2v67ADBH+JtsA9d4Rc84uMjvPXPB4JG2DdVaU+m3C4CGu7g@mail.gmail.com>
Subject: Re: [PATCH] Input: axp20x-pek - make device attributes static
To:     "Ben Dooks (Codethink)" <ben.dooks@codethink.co.uk>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Dec 17, 2019 at 11:25 PM Ben Dooks (Codethink)
<ben.dooks@codethink.co.uk> wrote:
>
> The two device attrbitues are not declared outside this file
> so make them static to avoid the following warnings:
>
> drivers/input/misc/axp20x-pek.c:194:1: warning: symbol 'dev_attr_startup' was not declared. Should it be static?
> drivers/input/misc/axp20x-pek.c:195:1: warning: symbol 'dev_attr_shutdown' was not declared. Should it be static?
>
> Signed-off-by: Ben Dooks (Codethink) <ben.dooks@codethink.co.uk>
> ---
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: linux-input@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org

Acked-by: Chen-Yu Tsai <wens@csie.org>
