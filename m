Return-Path: <linux-input+bounces-4693-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D5EB691BA23
	for <lists+linux-input@lfdr.de>; Fri, 28 Jun 2024 10:36:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F6D71F21F26
	for <lists+linux-input@lfdr.de>; Fri, 28 Jun 2024 08:36:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1662714386F;
	Fri, 28 Jun 2024 08:36:05 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F59114B970
	for <linux-input@vger.kernel.org>; Fri, 28 Jun 2024 08:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719563765; cv=none; b=anTO9LrYNS0Wpm5RlAxmGfhNMert/O4JNez1hkMeV3feuX7z5d9UjX3RZhEo84XWNvr4u6DtfhBzLzrBsy0ZVMmsaW3wgooWf29lo/+X8yVxGXo3bZjRlV806hvLIF+MqCNNdRwVOkipMVXa0zLZs15MinnROHBSA7ZyDdop4Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719563765; c=relaxed/simple;
	bh=gHMdO7hF0ijVO2uBybJPigxxQb5PDIZ2BIRF4UZbLlM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=s9ZXYUYgbg9MVlyaKtwNdI6U6ZMt8SDE5AZrbD7e18o/IT+Rt3KcIrRSylmtholxS39Vllk8/W7JUK72O6LXMPza46/TYNYHHkaOg20IxZWhj7jm8iULzX3xnxGLFJl960kAI3yriQocAtFrbejO0QIONmP0OF4RVgijXHXXPkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1sN75I-00079B-Oc; Fri, 28 Jun 2024 10:35:56 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1sN75I-005Z2n-A4; Fri, 28 Jun 2024 10:35:56 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1sN75I-0002mC-0o;
	Fri, 28 Jun 2024 10:35:56 +0200
Message-ID: <823c4c54441af0f2f9e392a142e582120a335440.camel@pengutronix.de>
Subject: Re: [PATCH] Input: exc3000 - add EXC81W32 support
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
 kernel@pengutronix.de
Date: Fri, 28 Jun 2024 10:35:56 +0200
In-Reply-To: <Zn2Yfeaewi-Bxx83@google.com>
References: 
	<20240626-input-exc3000-exc81w32-v1-1-ac42d3b87aff@pengutronix.de>
	 <Zn2Yfeaewi-Bxx83@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org

On Do, 2024-06-27 at 09:51 -0700, Dmitry Torokhov wrote:
> Hi Philipp,
>=20
> On Wed, Jun 26, 2024 at 04:26:48PM +0200, Philipp Zabel wrote:
> > This adds support for EXC81W32 controllers.
> >=20
> > Tested with firmware reported as type "PCAP81X32 Series",
> > model "Orion_0183_1019", fw_version "8001280G".
> >=20
> > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> > ---
> >  .../devicetree/bindings/input/touchscreen/eeti,exc3000.yaml        | 1=
 +
> >  drivers/input/touchscreen/exc3000.c                                | 7=
 +++++++
> >  2 files changed, 8 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/input/touchscreen/eeti,e=
xc3000.yaml b/Documentation/devicetree/bindings/input/touchscreen/eeti,exc3=
000.yaml
> > index 9dc25d30a0a8..c299838e2680 100644
> > --- a/Documentation/devicetree/bindings/input/touchscreen/eeti,exc3000.=
yaml
> > +++ b/Documentation/devicetree/bindings/input/touchscreen/eeti,exc3000.=
yaml
> > @@ -18,6 +18,7 @@ properties:
> >        - eeti,exc3000
> >        - eeti,exc80h60
> >        - eeti,exc80h84
> > +      - eeti,exc81w32
> >    reg:
> >      const: 0x2a
> >    interrupts:
>=20
> Could you please split this chunk into a separate patch so that DT folks
> can chime in on it separately from the driver change?

Sorry, fixed in v2.

regards
Philipp

