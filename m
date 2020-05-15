Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48A631D56FB
	for <lists+linux-input@lfdr.de>; Fri, 15 May 2020 19:02:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726204AbgEORCL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 15 May 2020 13:02:11 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:37019 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726144AbgEORCK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 15 May 2020 13:02:10 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id BC0785C009A;
        Fri, 15 May 2020 13:02:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute7.internal (MEProxy); Fri, 15 May 2020 13:02:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hmh.eng.br; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=KHi3vAnNeG4L/A13DMJfIvBD/Gg
        rl6tK6va8uWy/HFw=; b=i7sZYLxAYfCSq+erbSzt+PtEFjfPHAYGF6w/hAvWVhy
        /uSrKITBIzEoYtLOTcQc6h1jku94N7UI9sPvVxIpO7m9LnY1MnhDHxPBp3VwODeQ
        BCBaOmFiRW98NH6kn4CwWLe4rT06zmPKH27AiNLsPdl1gDMK0AP72mHYBso4FhUM
        DdFi1Yb+noO4As1AstGZnae+sHNBMJt9QYlrJmYnwvo7/DrwJk+7/VOUpqSb0Uxz
        kKigp3fcZjrtJuUtTkx40UVGY31eINNYHmbGs3owayb5YIbt3s/5ndtRyVBmfzJT
        gMcYy3Su1cp1KdQ0/cFGLcbcbPFK4aZj9INuZHWffzw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=KHi3vA
        nNeG4L/A13DMJfIvBD/Ggrl6tK6va8uWy/HFw=; b=NjJ4hDUSUXL1KDeIQD5D3d
        wQ8EOCI7+j4QAPnUHjEFF3g334JWLE9gQHaqWLkM/RLIXQOZeF3KunB0MhrYssiW
        1qABZnlFowVfWtwft5ABxDcanlfXay/25BUH+o/SlH35emwjfWRV877jbX69w8HZ
        tSdXcjvSSruT7uZ6XSYCGCxfIWmt+Df5+f8PeJj2qd8SpWTICqkrKjDEVdWvOIMT
        gtVELqmQEozB8QOHS9PrJFMxOmzgxkwyngH7D6jW807j4a6ZqSBzxBm4Gp0WowqT
        ntNQE6ZahGwdCncKvBHIvMrh9OmCancKTkLgOuZgSsJsseXd97xxeLvq20IT0dAw
        ==
X-ME-Sender: <xms:Ecu-XlMxfIUOjPq-6D4cd8XZQwFSh4tAg7-XR25dJuHiLwAhCzYEjA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrleekgddutdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjfgesthdttddttdervdenucfhrhhomhepjfgvnhhr
    ihhquhgvucguvgcuofhorhgrvghsucfjohhlshgthhhuhhcuoehhmhhhsehhmhhhrdgvnh
    hgrdgsrheqnecuggftrfgrthhtvghrnhepveduteejgeeiudefuefgieehleejkeefudfh
    jeefgeekheekvddvheehleegveeinecukfhppedujeejrdduleegrdejrdefvdenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehhmhhhsehhmhhh
    rdgvnhhgrdgsrh
X-ME-Proxy: <xmx:Ecu-Xn-uqyRV4s2QNPAi79Ru1mgucFSmRhuvCSzwOZSltP05TZQCSQ>
    <xmx:Ecu-XkS-U9J5Ptaw3DSsuouiuFrI2TdwhDyiFg0UZLrwN6DrZca5Sw>
    <xmx:Ecu-XhuHLG7BIbKpossdUfa5YO5TOsH7H34Mk91IHsGWfYORFgDMKQ>
    <xmx:Ecu-XtnfGAQH0kywf5tzyBgp4Phds4z9mQ-V0fIIcH0IO4N0g5WzDw>
Received: from khazad-dum.debian.net (unknown [177.194.7.32])
        by mail.messagingengine.com (Postfix) with ESMTPA id DEDCC3280059;
        Fri, 15 May 2020 13:02:08 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
        by localhost.khazad-dum.debian.net (Postfix) with ESMTP id 89F3A340322E;
        Fri, 15 May 2020 14:02:07 -0300 (-03)
X-Virus-Scanned: Debian amavisd-new at khazad-dum.debian.net
Received: from khazad-dum.debian.net ([127.0.0.1])
        by localhost (khazad-dum2.khazad-dum.debian.net [127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id jmBy-JaIsHn2; Fri, 15 May 2020 14:02:02 -0300 (-03)
Received: by khazad-dum.debian.net (Postfix, from userid 1000)
        id 8A4F0340017E; Fri, 15 May 2020 14:02:02 -0300 (-03)
Date:   Fri, 15 May 2020 14:02:02 -0300
From:   Henrique de Moraes Holschuh <hmh@hmh.eng.br>
To:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc:     linux-input@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org,
        Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>,
        kernel@collabora.com
Subject: Re: [PATCHv2 5/7] platform/x86: thinkpad_acpi: Use
 input_device_enabled()
Message-ID: <20200515170202.GA6364@khazad-dum.debian.net>
References: <20200515164943.28480-1-andrzej.p@collabora.com>
 <20200515165227.28859-1-andrzej.p@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200515165227.28859-1-andrzej.p@collabora.com>
X-GPG-Fingerprint1: 4096R/0x0BD9E81139CB4807: C467 A717 507B BAFE D3C1  6092
 0BD9 E811 39CB 4807
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 15 May 2020, Andrzej Pietrasiewicz wrote:
> Use the new helper. Inspecting input device's 'users' member needs to be
> done under device's mutex, so add appropriate invocations.
> 
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>

Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>

> ---
>  drivers/platform/x86/thinkpad_acpi.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 0f704484ae1d..8ae11b8c3ebb 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -2671,9 +2671,10 @@ static void hotkey_poll_setup(const bool may_warn)
>  	const u32 poll_driver_mask = hotkey_driver_mask & hotkey_source_mask;
>  	const u32 poll_user_mask = hotkey_user_mask & hotkey_source_mask;
>  
> +	mutex_lock(&tpacpi_inputdev->mutex);
>  	if (hotkey_poll_freq > 0 &&
>  	    (poll_driver_mask ||
> -	     (poll_user_mask && tpacpi_inputdev->users > 0))) {
> +	     (poll_user_mask && input_device_enabled(tpacpi_inputdev)))) {
>  		if (!tpacpi_hotkey_task) {
>  			tpacpi_hotkey_task = kthread_run(hotkey_kthread,
>  					NULL, TPACPI_NVRAM_KTHREAD_NAME);
> @@ -2690,6 +2691,7 @@ static void hotkey_poll_setup(const bool may_warn)
>  				  poll_user_mask, poll_driver_mask);
>  		}
>  	}
> +	mutex_unlock(&tpacpi_inputdev->mutex);
>  }
>  
>  static void hotkey_poll_setup_safe(const bool may_warn)

-- 
  Henrique Holschuh

  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
