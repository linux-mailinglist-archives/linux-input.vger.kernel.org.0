Return-Path: <linux-input+bounces-7717-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E21779B1F1F
	for <lists+linux-input@lfdr.de>; Sun, 27 Oct 2024 16:38:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A13B1C20AD5
	for <lists+linux-input@lfdr.de>; Sun, 27 Oct 2024 15:38:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFC2616F8F5;
	Sun, 27 Oct 2024 15:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net header.b="Uf1Q3rTH"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D8BB640;
	Sun, 27 Oct 2024 15:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730043478; cv=none; b=DzRZvKx/z2gOUAoJGysjWjCZ0Y7AXMdUwjpRrL3M+/2vIYUrV6W0Ow+hPccarFlS+xyn1aFuzIE3QnyvGmAA9IViQAgbp7gPu6TWvJ1AHZjGpebekSiM4ojDH3tPcFx20XadgQQCY6wH/gGWWJBYnJ4elKBjvZkD3X7F1yvi8rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730043478; c=relaxed/simple;
	bh=aMqM3/9s8d9LV0yWPG7wkoQZ5rqAivQmGr2aPzn6kVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Nvu/yYdAt27Bha3YnR771pGDyzEcgUCYNgUhn4HRdK3pfO096gWlJ2PtxdtOMWmeM7glju5OQoDjsr1aiMZgtF2olyB5+5JRkC0JCG5JoVK2GM+CW0zi1fRAkQpjAugWBi/BtM7AEOLIv/GTF3VOUI2YhuruwiryLsGoksLyRQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net header.b=Uf1Q3rTH; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1730043466; x=1730648266; i=ps.report@gmx.net;
	bh=RubjZSxE8AGnSNfV7sB96uuCUx0J27w5smtNhwXneeY=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Uf1Q3rTHH4unirV/gdcAaPJGM0ipV+lrUe26h36vXXyMm45SAcKC4p1ChRFmRNEj
	 xAQrhC0sO7z0S0dI6sF1st79xlM2AxVwf+z6OeoFclTNBfESvcPolXS8zEhUnJNL1
	 +0pKJDWa4ZeLrRSrXU3sV4bMrAWmwhY6A1WKQDJLlayWvrtds94BHV8TSZcUSzo/K
	 fd9RlsQvsxYuu6AmjRtfzPW1f8/kdTibgx3qzBgFZjRo64Tk9QgN/pEoKvrj1n57C
	 GTTuwKBm3xRBFpy9WBXQIdkEbodqFsm47T1mthThAe57xDsZ+GdVSi+O2xlYFMBWD
	 AF2DkNa1xRC6eCVc4A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([82.135.81.151]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MNt0C-1tFzPt3JH6-00StcE; Sun, 27
 Oct 2024 16:37:45 +0100
Date: Sun, 27 Oct 2024 16:37:44 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Christian Heusel <christian@heusel.eu>
Cc: "Ned T. Crigler" <crigler@gmail.com>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev, Jeff LaBundy
 <jeff@labundy.com>, Benjamin Tissoires <bentiss@kernel.org>
Subject: Re: [REGRESSION] disabling and re-enabling magic sysrq fails after
 kernel 6.11
Message-ID: <20241027163744.2d396c61@gmx.net>
In-Reply-To: <69b6119c-3c3a-406f-9375-3e55fba9b732@heusel.eu>
References: <Zx2iQp6csn42PJA7@xavtug>
	<69b6119c-3c3a-406f-9375-3e55fba9b732@heusel.eu>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:x6Ej45qEVG36VIlMVNp9H7pB/diSB9t4AZM3pUa/7+gX/vMGutH
 xVFrMSR2xdkE2AqP7FCxo6YeJcu7qJsQi7WebaJq8zbGAxoqFj8YyZihOgPxlFi4o+f+T4+
 6MRlrmpWni9WBR7mtE6aXVzQ2AeQIktaDC/YMwITPf3cCsGZQ3MJOqIpTywSVArjgoMS2ww
 WDMC9siawWxce3DYJL1Gw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Bkr3ymwo2hA=;bLCXZjt6sYcWROPGK+CQNGWr4jG
 ywaAPAUD8naTEi3hXc1oWUd7SmlFeQO1A9a6/xb9gcR4XDaVxMRvTIpUYaZqEQjLcbVzaMmqj
 fnmJp67vNhl1BchK/LY/KY4lUc03zNLKqgCf0LcfUMi3MuoLczxeq2iNehNpLh0cRO0XKfp30
 QRPFn9dYNPcVzuIaasll0NFdO859KpOg5w42ebUw0YNyKud5+6QZkH/U7aT0N4HYZHz4jScqN
 1QtSXpgtdYuzHgEhGX5WuZf6pnsiPQo318lmNpQ7Dg6v/Qb74RB/CqyMSXNK9XDfyPbkeEd/u
 oDFRymx3GS8GfGp21c4zZ1dXjllbSJYN24it9+zUI9/qdbTsbMGtGFm9GBltEn0hOOHSWsOEq
 eoNu6b7QJBkF8rXbvtIT2YX5G4+jo3ISLTNLftC/IT/nLdOAs5yFw+iTCFKKPhAPpAafGBLsI
 lAJGd1e9FL3HgBuSI3xPMIaEURTjj6YCntAgb7TN8K7Zg6lQAM/j5LfjbPiwmGkVlx+5OvRFb
 aFBCamyMJsJFL48m8Fn0X0sH02Pv8PlfEq8nm5nTM690QB7Mn1uwvLVf4TD5IwgFRMzOQci3N
 c8yJjbwZlZzbNBE9ZhpvfLu6kogNUIb+SUezkeFKApHpyq083mbAM54OpG68mam1w2n7G/fb1
 7bY0NWmHzUxnzy6rcl3jycCsvCBmLl6siidZJCO3rphfMk9jLF1DxFmxVN8+pFiuohnsj1MND
 V4I/NXuJE9OsSvkAyjTKjvIM7FzC+bMfSfbgMzjmmPzGs+baNTaZ096Dzl5J7sBDRyDhtTeNj
 PpJmvCk3hgeN4ELCAH1wE4xg==

Hello Ned, Christian, *,

On Sun, 27 Oct 2024 15:06:09 +0100, Christian Heusel <christian@heusel.eu>=
 wrote:

> On 24/10/26 07:15PM, Ned T. Crigler wrote:
> > Hi,
>
> Hey Ned,
>
> > It looks like starting with kernel 6.11, disabling and re-enabling
> > magic
> > sysrq fails with these errors in dmesg:
> >
> > kernel: input: input_handler_check_methods: only one event processing
> > method can be defined (sysrq)
> > kernel: sysrq: Failed to register input handler, error -22
> >
> > after doing:
> >
> > # echo 0 > /proc/sys/kernel/sysrq
> > # echo 438 > /proc/sys/kernel/sysrq
> > # echo 0 > /proc/sys/kernel/sysrq
> > # echo 438 > /proc/sys/kernel/sysrq
> > # echo 0 > /proc/sys/kernel/sysrq
> > # echo 438 > /proc/sys/kernel/sysrq
>
> I have found that this issue is also present in the latest mainline
> release and bisected it to the following commit:
>
>     d469647bafd9 ("Input: simplify event handling logic")
>

After the mentioned commit a call sysrq_register_handler() -->
input_register_handler(&sysrq_handler) with sysrq_handler.filter set
will result in sysrq_handler.events set to input_handler_events_filter,
see drivers/input/input.c (line 2607 to 2608):

2596 int input_register_handler(struct input_handler *handler)
2597 {
2598         struct input_dev *dev;
2599         int error;
2600
2601         error =3D input_handler_check_methods(handler);
2602         if (error)
2603                 return error;
2604
2605         INIT_LIST_HEAD(&handler->h_list);
2606
2607         if (handler->filter)
2608                 handler->events =3D input_handler_events_filter;
2609         else if (handler->event)
2610                 handler->events =3D input_handler_events_default;
2611         else if (!handler->events)
2612                 handler->events =3D input_handler_events_null;

So the second call will fail at the check 'input_handler_check_methods(han=
dler)'
which only allows one method to be set, see drivers/input/input.c:

2517 static int input_handler_check_methods(const struct input_handler *ha=
ndler)
2518 {
2519         int count =3D 0;
2520
2521         if (handler->filter)
2522                 count++;
2523         if (handler->events)
2524                 count++;
2525         if (handler->event)
2526                 count++;
2527
2528         if (count > 1) {
2529                 pr_err("%s: only one event processing method can be d=
efined      (%s)\n",
2530                        __func__, handler->name);
2531                 return -EINVAL;
2532         }
2533
2534         return 0;
2535 }


A quick fix/hack for the sysrq case:

=2D-- a/drivers/tty/sysrq.c
+++ b/drivers/tty/sysrq.c
@@ -1045,7 +1045,7 @@ static inline void sysrq_register_handler(void)
        int error;

        sysrq_of_get_keyreset_config();
-
+       sysrq_handler.events =3D NULL;
        error =3D input_register_handler(&sysrq_handler);
        if (error)
                pr_err("Failed to register input handler, error %d", error=
);
lines 1-13/13 (END)

Regards,
Peter


> The additional authors / maintainers have been added to the recipients
> lists.
>
> I hope I didn't overlook any pending fixes.
>
> > --
> > Ned T. Crigler
>
> Cheers,
> Chris


