Return-Path: <linux-input+bounces-12757-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8AECAD2E44
	for <lists+linux-input@lfdr.de>; Tue, 10 Jun 2025 09:03:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 132E81892FE2
	for <lists+linux-input@lfdr.de>; Tue, 10 Jun 2025 07:03:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0D96AD21;
	Tue, 10 Jun 2025 07:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=readahead.eu header.i=@readahead.eu header.b="okJSHquu";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="S3S9pM3o"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ADEB27A93B
	for <linux-input@vger.kernel.org>; Tue, 10 Jun 2025 07:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749539004; cv=none; b=hO7HDQqdEDwLYR5TTLqEoF8ZXdbMa88d9T4akMu7zM1lMz3K6eWKI4do3hBsoZftdy0zzERVC6l91dV5AwFMjySVhkMTx67sUhoyC1oG8Iqe9uHLETROnMoHZoKH/rWvP1m+NNe4Fex7tHYS0Y7LvUj9JAEzXBerkuxGWY8rdcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749539004; c=relaxed/simple;
	bh=I/CFYzsbm/bImbmumTys3Ig1se1iuxPQ3FpJGKqi0Ow=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=IELmQtg5SW6K4DhO8LMCvl4KUpAyH8gyzVOv9RCRkzLpZfKDmXFOSKXBlePo38Vay+JEZGDXaEU6A54FOFbJGgia4Z4Xp+exNJaZhbWI03n6/Duk8WWSWiCz8x68QzfmdNEmapCYaovVOZayH7IrmPUDUXI+Xzs0X7rKuPRXCpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readahead.eu; spf=pass smtp.mailfrom=readahead.eu; dkim=pass (2048-bit key) header.d=readahead.eu header.i=@readahead.eu header.b=okJSHquu; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=S3S9pM3o; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readahead.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=readahead.eu
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 087972540199;
	Tue, 10 Jun 2025 03:03:18 -0400 (EDT)
Received: from phl-imap-18 ([10.202.2.89])
  by phl-compute-02.internal (MEProxy); Tue, 10 Jun 2025 03:03:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=readahead.eu; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1749538997;
	 x=1749625397; bh=li/bDH7rOuW5gWK+tB5hxWeQ344diqDgbFUOoyQPshI=; b=
	okJSHquuvwf6vwtRRtwIArVeKkTcIE3jvFVTdxA5dCzGdyNCy4o6w2qFZ3jJwz8a
	YnKilg7HWtZtFX2rJy8GM71jCjCPqoNpMzrMLk1GyqvT0QmoXD07w5pc+6s4953g
	lDgRULn4tZvAJ+t0eeq92ZsVuaD7ssjS4q8CBFyoqVNB0A2HkOvBqtnhqehujGpX
	auya2r8Zp+LWeXEqSuVoTWv5aX4nXqZrK7+KxiY7fW7rnACyjz5xhE+RpJu/D0Ha
	t1bU8vdKFCuFvoXO6RjUXblCCEvUFP/tE2etWGPyf6sdIL0UKXXwRaux2rF4fSx4
	ekTBLQzAh41OB+BkBysZew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1749538997; x=1749625397; bh=l
	i/bDH7rOuW5gWK+tB5hxWeQ344diqDgbFUOoyQPshI=; b=S3S9pM3o4BP8xmrTP
	/ot3kLdppgYKn/JHW8Jnx6WZ9OYzwm/88UrTRgM8MVZ8hcKqhhK1UI7vmFD9EIBl
	7ApqkzoZSPp92wWOv8cAHn4+p3GWXMVv99WreWFFLVe75IylGrd1TmMBWqst1Yr9
	BtdsiLdDJNiHfhG0NmE7NKT5g0yxvsW1gJHgSs9MDDxxE3k4E+u9qFiDbvNTNDXv
	ajnKelpKtB0zD1BQNg4lH6CTtlyBTDiDsk7EE61XnqAva0uSkOIkn5ZNaz0ZCiqg
	DQ7QjaMSlN4NgQmTPIyrjriKRQhE/LnIr2DRFHqtsImEIdlEvqI79PKs8ohd3sBg
	vc4lw==
X-ME-Sender: <xms:tdhHaHYITPEH9r3aLku-ME2ADr1bcRHyrTMjd8CNbh6ByiLNyV_xzA>
    <xme:tdhHaGa6t3V7JvwHf_MbD_AGCfvo4HosTVOR_zhqRcYFguEDjRylgVcmWCd15fPhi
    Grsia8JpgX1tczmoTE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddutdegtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvkfgjfhfutgfgsehtqhertdertdej
    necuhfhrohhmpedfffgrvhhiugcutfhhvghinhhssggvrhhgfdcuoegurghvihgusehrvg
    gruggrhhgvrggurdgvuheqnecuggftrfgrthhtvghrnhepffeggffgleegkeffuedvieeh
    hfetleeuiedttefghfeihfeludevfffgheekheehnecuffhomhgrihhnpehstghivghntg
    gvughirhgvtghtrdgtohhmpdhgihhthhhusgdrtghomhdpfihiihgsrhgvfidrohhrghen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegurghvih
    gusehrvggruggrhhgvrggurdgvuhdpnhgspghrtghpthhtohepvddpmhhouggvpehsmhht
    phhouhhtpdhrtghpthhtoheplhhinhhugidqihhnphhuthesvhhgvghrrdhkvghrnhgvlh
    drohhrghdprhgtphhtthhopehsohhphhhivgdruggvgihtvghrjeegseihrghhohhordgt
    ohdruhhk
X-ME-Proxy: <xmx:tdhHaJ9ZGnJfD28r8o4gK5rbYQXLrLBPuVf4eOPMzTc0H0Z90BGDeA>
    <xmx:tdhHaNpuNAcQVDCRw1j5mxWx6soI25na5xKQJIv1kpSclhHV0ywhbw>
    <xmx:tdhHaCrTJqYKsc1NY19sGSDb6OouEbWIhqqqt5_7W-HvCF7dlSPXSg>
    <xmx:tdhHaDRB3jfi4oEkveyRXNgWz-2EDsNczJV9s3ZQxS-9t9PyBwxRfw>
    <xmx:tdhHaGoHsKtIEXGCPEbA0tMHixQ1nObVm2P6EAn-IICgD40uMRFYP8uj>
Feedback-ID: id2994666:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E80A815C007B; Tue, 10 Jun 2025 03:03:16 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T64f0b71317c87d46
Date: Tue, 10 Jun 2025 09:02:37 +0200
From: "David Rheinsberg" <david@readahead.eu>
To: "Sophie Dexter" <sophie.dexter74@yahoo.co.uk>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Message-Id: <b1ac223a-06b6-40fd-a290-a67399a29630@app.fastmail.com>
In-Reply-To: <170711555.4359978.1748472767597@mail.yahoo.com>
References: <170711555.4359978.1748472767597.ref@mail.yahoo.com>
 <170711555.4359978.1748472767597@mail.yahoo.com>
Subject: Re: [PATCH RFC] drivers/hid/hid-wiimote: Improve Wiimote Balance Board input
 reporting
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi!

On Thu, May 29, 2025, at 12:52 AM, Sophie Dexter wrote:
> Hi all,
>
> Although the balance board is reportedly fairly accurate and not=20
> significantly affected by heavy use,=20
> https://www.sciencedirect.com/science/article/abs/pii/S096663621300318=
4,=20
> a few projects aiming to use Wii Balance Board as weighing scales=20
> question its accuracy for weights below 10 or 20 kilograms e.g:=20
> https://github.com/jmahmood/bbev and=20
> https://github.com/SilverLuke/PC-Fit.
>
> The kernels' hid-wiimote module's current implementation provides=20
> 'cooked' weight sensor values in decigrams (units of 10 grams) derived=20
> by interpolating 'raw' sensor values between 0, 17 and 34kg calibratio=
n=20
> values. For sensor values higher than 34kg extrapolation continues to=20
> use the higher, 17 and 34 kg, calibration points. However, for sensor=20
> values below the 0kg calibration points the driver simply returns a=20
> fixed bottom limit of 0, and therein lies the problem.
>
> Based on a sample of 2 balance boards, absolute sensor values from old=20
> and battered balance boards can have positive or, and crucially,=20
> negative offsets in excess of 1kg relative to their original=20
> calibrations. E.g. if a sensor has a -1.5kg offset the kernel module=20
> will report 0 for that sensor until the balance board is loaded by=20
> about 6 kg since each sensor 'sees' roughly a quarter of the total=20
> weight on the board.
>
> A more subtle consideration is that the current implementation uses=20
> simple integer division in its interpolation calculations which on=20
> average will round
> down the summed total of the four sensor values by 20 grams.=20
>
> Even more subtly, the Wii Balance Board's stiffness varies by around 1=
%=20
> for every 14=C2=B0C temperature change,=20
> https://wiibrew.org/wiki/Wii_Balance_Board. However, the current=20
> wiimote hid driver doesn't use the balance board's temperature sensor=20
> or reference temperature calibration point.
>
> Lastly, there is a small adjustment that Wii Fit is said to make that=20
> may be to normalise to Standard Gravity. This scales the whole result=20
> by a factor of ~0.99908.
>
> While none of this is a problem for applications that are only=20
> concerned with relative values, e.g. games and COP (centre of pressure=
)=20
> applications, it is for
> for me because I want reliable, absolute measurements of relatively=20
> small weights to monitor my small breed pet dogs at home.

Thank you for the detailed explanation! This sounds all reasonable to me.

> My proposed patches addresses each of these issues
> 1) Report 'negative' weights
> =C2=A0=C2=A0=C2=A0 Benefit: The balance board can be used by applicati=
ons to weigh=20
> objects down to 0 kg no matter how battered they are.
> =C2=A0=C2=A0=C2=A0 Consideration: Any weighing scales application will=
 need a=20
> 'zeroing' facility to accommodate for any offsets from balance board=20
> calibration points.
> =C2=A0=C2=A0=C2=A0 Risk: May break existing applications that cannot h=
andle negative=20
> sensor values.

This should be fine. The linux event interface can deal with those value=
s.

> 2) Use the Kernel's DIV_ROUND_CLOSEST macro
> =C2=A0=C2=A0=C2=A0 Benefit: Improved accuracy.
> =C2=A0=C2=A0=C2=A0 Consideration: Uses more CPU time, code bloat.
> =C2=A0=C2=A0=C2=A0 Risk: none?

Again, sounds good to me!

> 3a) Perform compensation for temperature and gravitational acceleration
> =C2=A0=C2=A0=C2=A0 Benefit: Improved accuracy
> =C2=A0=C2=A0=C2=A0 Consideration: Uses more CPU time, code bloat.
> =C2=A0=C2=A0=C2=A0 Risk: none?

Sounds good!

> 3b) Report calibration reference temperature for use by user-space=20
> applications to
> =C2=A0=C2=A0=C2=A0 /sys/bus/hid/drivers/wiimote/<dev>/bboard_ref_temp
> =C2=A0=C2=A0=C2=A0 Benefit: Improved accuracy (user-space applications)
> =C2=A0=C2=A0=C2=A0 Consideration: Uses more CPU time, code bloat.
> =C2=A0=C2=A0=C2=A0 Risk: none?

Doesn't the `bboard_calib` sysfs-file already include that information?

> Testing: Having made these proposed changes to the kernel's hid-wiimot=
e=20
> module, and dealing with the 'zeroing' issue in user-land, I can use m=
y=20
> balance board to weigh both of my dogs, measurements are within 10-20=20
> grams of those made by my veterinary practitioner's scales, and to=20
> weigh myself with measurements within 100 grams of my bathroom scales.=20
> As an independent verification I weighed 8 bottles of wine individuall=
y=20
> using kitchen scales put them on each of the 2=C2=A0 Wii Balance Board=
s=20
> available to me and got the expected result :-)
>
> Thank you for your consideration,
> Sophie.
>
> Here follows a patch that can be applied against v6.15, commit 0ff41df=20
> (I hope I've done things correctly):
>
> ---
> =C2=A0drivers/hid/hid-wiimote-modules.c | 144=20
> ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++++++++++++++++++++++++++++++++++++++++++++++--------------
> =C2=A0drivers/hid/hid-wiimote.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 1 +
> =C2=A02 files changed, 130 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/hid/hid-wiimote-modules.c=20
> b/drivers/hid/hid-wiimote-modules.c
> index dbccdfa63916..67bf0fed062a 100644
> --- a/drivers/hid/hid-wiimote-modules.c
> +++ b/drivers/hid/hid-wiimote-modules.c
> @@ -1302,8 +1302,30 @@ static const struct wiimod_ops wiimod_classic =3D=
 {
> =C2=A0 * Some 3rd party devices react allergic if we try to access nor=
mal=20
> Wii Remote
> =C2=A0 * hardware, so this extension module should be the only module =
that=20
> is loaded
> =C2=A0 * on balance boards.
> - * The balance board needs 8 bytes extension data instead of basic 6=20
> bytes so
> - * it needs the WIIMOD_FLAG_EXT8 flag.
> + * The balance board has 11 bytes extension data instead of basic 6=20
> bytes so
> + * it needs the WIIMOD_FLAG_EXT16 flag.
> + *
> + * The stiffness of the Wii Fit's sensors decreases with temperature=20
> which
> + * causes them to indicate higher than actual weight at high=20
> temperature and
> + * and lower than actual weight at low temperature. The net effect is=20
> about
> + * a 1% error for a difference of 14 in the balance board's=20
> temperature sensor
> + * reading compared to a reference temperature. Wii Fit compensates=20
> for the
> + * temperature value with the calculation:=20
> + * (.999 * total_weight * -(.007 * ((board_temp - ref_temp) / 10.0) -=20
> 1.0))
> + * where 0.999 is actually 0.9990813732147217 (0x3feff87980000000) an=
d=20
> .007 is
> + * actually 0.007000000216066837 (0x3f7cac0840000000, (double).007f).
> + *
> + * To do the same using integer maths we must refactor to subtract=20
> fractions.
> + * For the temperature compensation part we subtract a 1429th of the=20
> sensor
> + * value multiplied by the temperature difference (1/(0.007/10)), then
> + * subtract a 1089th of that value for the overall adjustment=20
> (1/(1-0.99908)).
> + *
> + * The refactored equation for each sensor is:
> + * final_weight =3D compensated_weight - (compensated_weight / 1089)
> + * where
> + * compensated_weight =3D sensor_weight - ( temp_diff * sensor_weight=
 /=20
> 1429)
> + * and
> + * temp_diff =3D board_temp - ref_temp

Minor nit: I would prefer if pseudo-code or math is indented by a few sp=
aces, or otherwise visually separated from the text around it.

> =C2=A0 */
>=C2=A0
> =C2=A0static void wiimod_bboard_in_keys(struct wiimote_data *wdata, co=
nst=20
> __u8 *keys)
> @@ -1316,7 +1338,7 @@ static void wiimod_bboard_in_keys(struct=20
> wiimote_data *wdata, const __u8 *keys)
> =C2=A0static void wiimod_bboard_in_ext(struct wiimote_data *wdata,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const __u8 *ext)
> =C2=A0{
> -=C2=A0=C2=A0=C2=A0 __s32 val[4], tmp, div;
> +=C2=A0=C2=A0=C2=A0 __s32 val[4], tmp, div, temp_diff, temp_corr, scal=
e_corr;
> =C2=A0=C2=A0=C2=A0=C2=A0 unsigned int i;
> =C2=A0=C2=A0=C2=A0=C2=A0 struct wiimote_state *s =3D &wdata->state;
>=C2=A0
> @@ -1337,10 +1359,24 @@ static void wiimod_bboard_in_ext(struct=20
> wiimote_data *wdata,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0=C2=A0 7=C2=A0=C2=A0 |=C2=A0=
 Bottom Left <15:8>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0=C2=A0 8=C2=A0=C2=A0 |=C2=A0=
 Bottom Left=C2=A0 <7:0>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0 -----+-------------------=
-------+
> +=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0=C2=A0 9=C2=A0=C2=A0 |=C2=A0 Te=
mperature=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |
> +=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0 -----+------------------------=
--+
> +=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0 10=C2=A0=C2=A0 |=C2=A0 NOT USE=
D=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |
> +=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0 -----+------------------------=
--+
> +=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0 11=C2=A0=C2=A0 |=C2=A0 Battery=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |
> +=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0 -----+------------------------=
--+
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *
> -=C2=A0=C2=A0=C2=A0=C2=A0 * These values represent the weight-measurem=
ents of the=20
> Wii-balance
> +=C2=A0=C2=A0=C2=A0=C2=A0 * The first 8 bytes represent the weight-mea=
surements of the=20
> Wii-balance
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * board with 16bit precision.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *
> +=C2=A0=C2=A0=C2=A0=C2=A0 * Temperature values less than the calibrati=
on reference=20
> temperature
> +=C2=A0=C2=A0=C2=A0=C2=A0 * indicate that that sensors are stiffer and=
 consequently produce=20
> lower
> +=C2=A0=C2=A0=C2=A0=C2=A0 * readings.
> +=C2=A0=C2=A0=C2=A0=C2=A0 *
> +=C2=A0=C2=A0=C2=A0=C2=A0 * A battery level =E2=89=A5 0x82 is 4 bars, =
less than 0x82 and =E2=89=A5 0x7D is=20
> 3 bars,
> +=C2=A0=C2=A0=C2=A0=C2=A0 * less than 0x7D and =E2=89=A5 0x78 is 2 bar=
s, less than 0x78 and =E2=89=A5 0x6A=20
> is 1
> +=C2=A0=C2=A0=C2=A0=C2=A0 * bar, and otherwise is considered empty.
> +=C2=A0=C2=A0=C2=A0=C2=A0 *=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * The balance-board is never reported i=
nterleaved with motionp.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>=C2=A0
> @@ -1360,23 +1396,52 @@ static void wiimod_bboard_in_ext(struct=20
> wiimote_data *wdata,
> =C2=A0=C2=A0=C2=A0=C2=A0 val[3] <<=3D 8;
> =C2=A0=C2=A0=C2=A0=C2=A0 val[3] |=3D ext[7];
>=C2=A0
> +=C2=A0=C2=A0=C2=A0 temp_diff =3D ext[8] - s->calib_bboard_temp;
> +
> =C2=A0=C2=A0=C2=A0=C2=A0 /* apply calibration data */
> =C2=A0=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < 4; i++) {
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (val[i] <=3D s->calib_b=
board[i][0]) {
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tm=
p =3D 0;
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else if (val[i] < s->cal=
ib_bboard[i][1]) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Interpolate using =
0 and 17kg datum points when sensor values are
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * less than their 17=
kg calibration points.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */

Can you put these comments inside of the blocks? So like this:

if (...) {
    /* comment about this block */
    ..code..
} else if (...) {
    /* another comment */
    ..code..
} else {
    /* last comment */
    ..code..
}

I think this matches better what the kernel coding-style looks like. Esp=
ecially the else-block below looks different than usual.

> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (val[i] < s->calib_bboa=
rd[i][1]) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 tmp =3D val[i] - s->calib_bboard[i][0];
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tm=
p *=3D 1700;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*=
 Divisor used for interpolation */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 div =3D s->calib_bboard[i][1] - s->calib_bboard[i][0];
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tm=
p /=3D div ? div : 1;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Interpolate using =
17 and 34kg datum points when sensor values are
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * equal to or greate=
r than their 17kg calibration points.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 tmp =3D val[i] - s->calib_bboard[i][1];
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tm=
p *=3D 1700;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 div =3D s->calib_bboard[i][2] - s->calib_bboard[i][1];
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tm=
p /=3D div ? div : 1;
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tm=
p +=3D 1700;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*=
 Add 17kg, the delta between 0 and 17kg datum points. */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tm=
p +=3D s->calib_bboard[i][1] - s->calib_bboard[i][0];
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val[i] =3D tmp;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * 1,700 is the facto=
r for interpolating between calibration points,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * which are 17kg apa=
rt, to achieve 0.01kg steps. This multiplication
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * also helps to miti=
gate the effect of rounding errors introduced in
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * subsequent divisio=
n calculations.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tmp *=3D 1700;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Apply temperature =
compensation of approximately -0.98% for every
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * 14 units of temper=
ature, likely degrees C, above that at which
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * board calibration =
was done.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 temp_corr =3D tmp * temp_d=
iff;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 temp_corr =3D DIV_ROUND_CL=
OSEST(temp_corr, 1429);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tmp -=3D temp_corr;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Nintendo's Wii Fit=
 is said to make this correction. Maybe it is an
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * adjustment for the=
 specific gravitational acceleration at their
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * calibration facili=
ty to normalise results to Standard Gravity.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Subtract approxima=
tely 0.092%.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 scale_corr =3D DIV_ROUND_CLOSEST(tmp, 1089);

This assignment should go on a newline, instead of being behind the `*/`.

> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tmp -=3D scale_corr;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* finally divide by the d=
elta between applicable calibration points*/
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val [i] =3D DIV_ROUND_CLOS=
EST(tmp, div ? div : 1);
> =C2=A0=C2=A0=C2=A0=C2=A0 }
>=C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 input_report_abs(wdata->extension.input, ABS_=
HAT0X, val[0]);
> @@ -1464,11 +1529,43 @@ static ssize_t wiimod_bboard_calib_show(struct=20
> device *dev,
>=C2=A0
> =C2=A0static DEVICE_ATTR(bboard_calib, S_IRUGO, wiimod_bboard_calib_sh=
ow, NULL);
>=C2=A0
> +static ssize_t wiimod_bboard_ref_temp_show(struct device *dev,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct device_attribute *a=
ttr,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 char *out)
> +{
> +=C2=A0=C2=A0=C2=A0 struct wiimote_data *wdata =3D dev_to_wii(dev);
> +=C2=A0=C2=A0=C2=A0 int ret;
> +=C2=A0=C2=A0=C2=A0 __u8 ref_temp;
> +
> +=C2=A0=C2=A0=C2=A0 ret =3D wiimote_cmd_acquire(wdata);
> +=C2=A0=C2=A0=C2=A0 if (ret)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
> +
> +=C2=A0=C2=A0=C2=A0 ret =3D wiimote_cmd_read(wdata, 0xa40060, &ref_tem=
p, 1);
> +=C2=A0=C2=A0=C2=A0 if (ret !=3D 1) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wiimote_cmd_release(wdata);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret < 0 ? ret : -EI=
O;
> +=C2=A0=C2=A0=C2=A0 }
> +
> +=C2=A0=C2=A0=C2=A0 wiimote_cmd_release(wdata);
> +
> +=C2=A0=C2=A0=C2=A0 spin_lock_irq(&wdata->state.lock);
> +=C2=A0=C2=A0=C2=A0 wdata->state.calib_bboard_temp =3D ref_temp;
> +=C2=A0=C2=A0=C2=A0 spin_unlock_irq(&wdata->state.lock);
> +
> +=C2=A0=C2=A0=C2=A0 ret =3D 0;
> +=C2=A0=C2=A0=C2=A0 ret +=3D sprintf(&out[ret], "%02x\n", ref_temp);
> +
> +=C2=A0=C2=A0=C2=A0 return ret;
> +}
> +
> +static DEVICE_ATTR(bboard_ref_temp, S_IRUGO,=20
> wiimod_bboard_ref_temp_show, NULL);
> +
> =C2=A0static int wiimod_bboard_probe(const struct wiimod_ops *ops,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct wiimote_data *wdata)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0 int ret, i, j;
> -=C2=A0=C2=A0=C2=A0 __u8 buf[24], offs;
> +=C2=A0=C2=A0=C2=A0 __u8 buf[24], offs, ref_temp;
>=C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 wiimote_cmd_acquire_noint(wdata);
>=C2=A0
> @@ -1482,6 +1579,11 @@ static int wiimod_bboard_probe(const struct=20
> wiimod_ops *ops,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wiimote_cmd_release(w=
data);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret < 0 ? ret =
: -EIO;
> =C2=A0=C2=A0=C2=A0=C2=A0 }
> +=C2=A0=C2=A0=C2=A0 ret =3D wiimote_cmd_read(wdata, 0xa40060, &ref_tem=
p, 1);
> +=C2=A0=C2=A0=C2=A0 if (ret !=3D 1) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wiimote_cmd_release(wdata);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret < 0 ? ret : -EI=
O;
> +=C2=A0=C2=A0=C2=A0 }
>=C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 wiimote_cmd_release(wdata);
>=C2=A0
> @@ -1494,6 +1596,7 @@ static int wiimod_bboard_probe(const struct=20
> wiimod_ops *ops,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 offs +=3D 2;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> =C2=A0=C2=A0=C2=A0=C2=A0 }
> +=C2=A0=C2=A0=C2=A0 wdata->state.calib_bboard_temp =3D ref_temp;
>=C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 wdata->extension.input =3D input_allocate_dev=
ice();
> =C2=A0=C2=A0=C2=A0=C2=A0 if (!wdata->extension.input)
> @@ -1506,6 +1609,13 @@ static int wiimod_bboard_probe(const struct=20
> wiimod_ops *ops,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto err_free;
> =C2=A0=C2=A0=C2=A0=C2=A0 }
>=C2=A0
> +=C2=A0=C2=A0=C2=A0 ret =3D device_create_file(&wdata->hdev->dev,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 &dev_attr_bboard_ref_temp);
> +=C2=A0=C2=A0=C2=A0 if (ret) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hid_err(wdata->hdev, "cann=
ot create sysfs attribute\n");
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto err_free;
> +=C2=A0=C2=A0=C2=A0 }
> +
> =C2=A0=C2=A0=C2=A0=C2=A0 input_set_drvdata(wdata->extension.input, wda=
ta);
> =C2=A0=C2=A0=C2=A0=C2=A0 wdata->extension.input->open =3D wiimod_bboar=
d_open;
> =C2=A0=C2=A0=C2=A0=C2=A0 wdata->extension.input->close =3D wiimod_bboa=
rd_close;
> @@ -1542,6 +1652,8 @@ static int wiimod_bboard_probe(const struct=20
> wiimod_ops *ops,
> =C2=A0err_file:
> =C2=A0=C2=A0=C2=A0=C2=A0 device_remove_file(&wdata->hdev->dev,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 &dev_attr_bboard_calib);
> +=C2=A0=C2=A0=C2=A0 device_remove_file(&wdata->hdev->dev,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 &dev_attr_bboard_ref_temp);
> =C2=A0err_free:
> =C2=A0=C2=A0=C2=A0=C2=A0 input_free_device(wdata->extension.input);
> =C2=A0=C2=A0=C2=A0=C2=A0 wdata->extension.input =3D NULL;
> @@ -1558,10 +1670,12 @@ static void wiimod_bboard_remove(const struct=20
> wiimod_ops *ops,
> =C2=A0=C2=A0=C2=A0=C2=A0 wdata->extension.input =3D NULL;
> =C2=A0=C2=A0=C2=A0=C2=A0 device_remove_file(&wdata->hdev->dev,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 &dev_attr_bboard_calib);
> +=C2=A0=C2=A0=C2=A0 device_remove_file(&wdata->hdev->dev,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 &dev_attr_bboard_ref_temp);
> =C2=A0}
>=C2=A0
> =C2=A0static const struct wiimod_ops wiimod_bboard =3D {
> -=C2=A0=C2=A0=C2=A0 .flags =3D WIIMOD_FLAG_EXT8,
> +=C2=A0=C2=A0=C2=A0 .flags =3D WIIMOD_FLAG_EXT16,
> =C2=A0=C2=A0=C2=A0=C2=A0 .arg =3D 0,
> =C2=A0=C2=A0=C2=A0=C2=A0 .probe =3D wiimod_bboard_probe,
> =C2=A0=C2=A0=C2=A0=C2=A0 .remove =3D wiimod_bboard_remove,
> diff --git a/drivers/hid/hid-wiimote.h b/drivers/hid/hid-wiimote.h
> index 9c12f63f6dd2..fd31797b4b06 100644
> --- a/drivers/hid/hid-wiimote.h
> +++ b/drivers/hid/hid-wiimote.h
> @@ -136,6 +136,7 @@ struct wiimote_state {
>=C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 /* calibration/cache data */
> =C2=A0=C2=A0=C2=A0=C2=A0 __u16 calib_bboard[4][3];
> +=C2=A0=C2=A0=C2=A0 __u8 calib_bboard_temp;
> =C2=A0=C2=A0=C2=A0=C2=A0 __s16 calib_pro_sticks[4];
> =C2=A0=C2=A0=C2=A0=C2=A0 __u8 pressure_drums[7];
> =C2=A0=C2=A0=C2=A0=C2=A0 __u8 cache_rumble;

A bunch of minor coding-style corrections, but otherwise this looks exce=
llent. Thanks a lot for investigating! If you resend this, please add th=
e HID maintainers in CC. You can find this via:

$ ./scripts/get_maintainer.pl -f drivers/hid/hid-wiimote-modules.c
David Rheinsberg <david@readahead.eu> (maintainer:WIIMOTE HID DRIVER)
Jiri Kosina <jikos@kernel.org> (maintainer:HID CORE LAYER)
Benjamin Tissoires <bentiss@kernel.org> (maintainer:HID CORE LAYER)
linux-input@vger.kernel.org (open list:WIIMOTE HID DRIVER)
linux-kernel@vger.kernel.org (open list)

You can also add my reviewed-by to the patch:

Reviewed-by: David Rheinsberg <david@readahead.eu>

Thanks a lot!
David

