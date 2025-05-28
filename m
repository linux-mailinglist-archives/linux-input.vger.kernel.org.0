Return-Path: <linux-input+bounces-12636-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EF14AAC748D
	for <lists+linux-input@lfdr.de>; Thu, 29 May 2025 01:43:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB918167C18
	for <lists+linux-input@lfdr.de>; Wed, 28 May 2025 23:43:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D31E6218585;
	Wed, 28 May 2025 23:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.co.uk header.i=@yahoo.co.uk header.b="GjLtkLuT"
X-Original-To: linux-input@vger.kernel.org
Received: from sonic310-12.consmr.mail.ir2.yahoo.com (sonic310-12.consmr.mail.ir2.yahoo.com [77.238.177.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C164685
	for <linux-input@vger.kernel.org>; Wed, 28 May 2025 23:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.238.177.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748475814; cv=none; b=Zpgn/YZI8DOiXF9DQcJucm1n521GqMtQoTqaplnyVTGA1ZadqEJZe7gyUSg+ygu026/xj0csYcLc+b5j/B8jBO8NAeWUGGKzDf97FU8NiLHXC1GPYJR8IwIdqLmtovJYAXn/Kr9meRnKN66qveZ5UeID2m1g1Eb1mq6jL7YUv9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748475814; c=relaxed/simple;
	bh=oMEWFdAHfCgR7ytX7vNQumyXF5FDTrejGxky3WmIoFo=;
	h=Date:From:To:Cc:Message-ID:Subject:MIME-Version:Content-Type:
	 References; b=rRKpWAMHNRKycSQqZJ6rpwQFd1idL4N32Z2i5KGOzJXFK+R1zFCinhJ96qpoJRR8hdHWKTyja80RQAVExw2jv71JkIlt9AsRFrD1hbZd7IGT52U2pQBLKtGJ6M8MNvhOE67XU6VnrbpnRn8R8MlWvKj5IJAwRiTIBSTeI9AIidw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.co.uk; spf=pass smtp.mailfrom=yahoo.co.uk; dkim=pass (2048-bit key) header.d=yahoo.co.uk header.i=@yahoo.co.uk header.b=GjLtkLuT; arc=none smtp.client-ip=77.238.177.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.co.uk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.uk; s=s2048; t=1748475810; bh=oMEWFdAHfCgR7ytX7vNQumyXF5FDTrejGxky3WmIoFo=; h=Date:From:To:Cc:Subject:References:From:Subject:Reply-To; b=GjLtkLuTgrd5POcqFQJ6b3TTB40kQG8mwSQFPW+IPsH4GKnNMyIhonmU2UQ6l39swmh2RcA1leZhgcWlDxtQTe12EnmMIlfYGUHhry52yVWp2hc5PngPPblw1a/B03OC2S9D+IeLKZ+uWFMjaDRM/jY+4/P5SE0ePlZXatdNGTSnDLsWzIRtr2AUZqhDyogRftRTLYfS+VcLFnB8/kV2yYn2D/04V+7fh8m8oLozP+NQljC3v0MxS3xNk6nu+jwv5ZR+nzHCRVKOBDfPiW2L6n4dVNgKFPJTxV0lKtL1cQh5q6zCegqN00ko1kBMHZ8Ypl0ZtkP+g63QioS5ADHmmQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1748475810; bh=I0Eadt/WB+T7tPjl3kZZPcHoV/u2x9HdlIjnFRsGDq+=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=MJE/VaJkwo7YtiN1HHOWc4poxLdRa4mxRsmEIARcRQkIef431glHM/ZYk4/XqUXSB2Vj1DgqyWdoS/h7V7XdaTD0fw9t8+fp/31GHtE+205NYHMyAeHxw+iE805rP24YPKQkmLCDwFmbJy3o0OBUxYFj6Me/Iys6ud6B8HXBmbAGU4piC34fsOGIT7k2rXRv5KlF41mLnuu+6ZoWmGWsbpJQy2AL6W5CnjUDb+c0dcWi5usJZ58/PXpqRpWsXh9ZFC6tmj/fu3H+gqFMbLtDQc3ldCe6PW0BhZcCcrmKfTcKgHOuvN6gzMtMmOWg8dHhOTxrIezkV4wZ9dDYIBeZIA==
X-YMail-OSG: ZtUkSVkVM1lE.FpUqwTe_CsDh0K8dbtTSrFaYsAMSiOoUj235UuRKQVxpe1ncJc
 lHAbc2kUsbrmMHDNgtMy_46llmkDtBgNxQFFXPZUP3mQ02CA..fBpVjqzTZdfRfkPj_UA28HbLha
 rHnVRL2Ondfhx1C8TbVGR9T3LUPo5lKjIllTnCumSMfc.FKFeGBJGrfPi3in8UK2j8eCUybfMfGx
 jIGfeBXLqu44hnWlx89SmwA3ygqgUW5wciZuqbIJlskbkJxGuN8Wt7Xg92M_huIjFJx5kw1X1CEZ
 mXEbJ00AxlJuBP6MA7gdTuVtvsY5qtcde1enw0WkVKlh7JPPCMJ5YQgnFMWsCJjmWwyoGJBM9NME
 pHxCBRCjRerIvbcvSBmxiyzbUcSO648Lzs3zDYcL4vXrQviPrzagRFpMDLkcP6tcWVGi8_zqq019
 DpoaqSMlEggMluNhci3dvdwuBCt0vygVBlu4wObBG7d5e.TVJNg62ovrXmsIi2xkbp2blgH_zt_W
 9lcK0ctso.m48bn2aGgotcVuNtcybIeLK3GSTmUmCX.Hl8lcJ2oD0R.Hic4FTUTTfyWh1ck3NsQL
 4eTKoBnnuJbLeY9LtNlX4KQPqn7WdmAtKeXyvNw8VEH8sWY5q9mbl06qust.1T__fkLCp2FHYV67
 45S9spbNeEn4ZMFqUzPvscisZNwDixi65qKSfs3C_Eik3TXMqFfxewjYd1cz2k3sLVzxMeYMd0Vu
 rIS26ymgGjrVFo_Nig_PIPIGtPGshkkdrdmDS6QsCXEVYRo981HxB3XMCnCNdCrHMu84hKIg0ehb
 BRR.05PO3makokzA1zf6LAXoIG6sLSm5k_HnfWTvDlAISsqbxbbE_J08NcXgubfBCGr3rKmVOEhl
 .5ZG7ApSP25g7Q6iY8nD1LkFMamrkrrxXwGJD8g.5U1tqKhf7CBVtSGsjw4g82JyYRvV.fQqqA12
 zTw2Y80xqvc.nPA6lRSbrg4fce_yA8WN8q15cCsqe36F6G.BUtfbq8TaPzMLhylfbI3L3MD5enuL
 EDwxnIAV_j3TO4Cb3pxCocDoFXtvpQc81RSVsVcLWNJSk3MXbWyy33eE1zZjzItTEVqwvO_c9TWy
 dEq4t39GUh1C5aFISsl1mZea4x1yd6w6AEoj1t0xGHnuJhht3NXqUxRrrIwpPkQMXpn1EXIcotv1
 j47Oa6uZM6lFyBmD9pB300riCt117LSBKEHaHUQ8iLlsmLuih_7l6QQZueG9dyXWqH4nVu2AmN9o
 OoNM4wcJJK8Z0llU8sWeGtKgeXGXbIgsiS53nqrXkgmudiYhTHKtSEmDfOaXdXumPWJLRTgSiu1V
 Ilw4oFvTd1vKz27_nzmoHuyiAYXhD6J6XS_A8Mnf3Gsov2y9nENS0quM3YlAnnmDF5gjt8YfN0RG
 8TqX0a.wytqBdVd7wTC7LDUEPs.Iu6O4m2VSrRawKoHKjwAAIHBAJBsA7BUlxSaGjwFWLgAPsZ4v
 DUmnTcQJ.AKqyKxhfwZ4j1g4Qgwwr4Gq7o2x1MHNurGlyoYODVDkOzELewL7yGNQ2TYQDKY8GE.H
 aMeSCvoQYb.u3WJeXwQyAdwCXBcGymFXh9YY9dJ6Qp4bPqzXTAZDf3oWlIjLOwe1UD0ub.5zNAWj
 onU3F8W_1Yds.7aYG8SikEchnykpCpH04JL9BtCNuBEVwjEhNpLZ0AhiWP9pxYX82VPNdbXPeAB0
 iymtjNyn0xpc4HQYelPUpCm7uNlR3Wnsna9xRruNdZupTjkuBlpAjI5e.ziFcLlvB.EKE6hGVgrf
 xpjWfm1X9REG3QVrrWDxd0DVtWh1Zy3q0IZLJHEI5irSOyTL_AcarbeLeL3NwwZAdD2_qGgWavBT
 5DiaavJNMvmCRHUzEYxQPpAyoiX.8pRcCLihYTxfhUZVpjfpyboDnitJpU4EXkNWLomk7F6SOGTy
 GKCmY.86APVukIz6F54BpauBuImcfAD9Pso.R1SyMOJ0K4V5o18wu.zsg11zt4xEUarWOkmvQmZp
 KDSMCI.P5eMwlQhMCY.06FQovPaKh2ZGI4OP9FBHj3KdzHJ5EEWwv6qWie5CjvZgUh2KiagNpvjt
 EDwHygbvAJ3V8KwOKq1s4Hqv8s_ylNVGCbQ3jmU9C_bfLKulGy8GG3awYu_uaDgdcwqlWXQjEXcV
 o1JZut67E7d.Bd1B4LyzvtMuW9sWMNTtRV_krLU5vlYciee3KYWligq.zrM2852gjNMxfpewKLkf
 cwRnYgV0eVh00vjW4fmhqX1V9QN1I
X-Sonic-MF: <sophie.dexter74@yahoo.co.uk>
X-Sonic-ID: 1f34fab7-9b25-4a25-ad3c-ca07f40f48de
Received: from sonic.gate.mail.ne1.yahoo.com by sonic310.consmr.mail.ir2.yahoo.com with HTTP; Wed, 28 May 2025 23:43:30 +0000
Date: Wed, 28 May 2025 22:52:47 +0000 (UTC)
From: Sophie Dexter <sophie.dexter74@yahoo.co.uk>
To: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Cc: "david@readahead.eu" <david@readahead.eu>
Message-ID: <170711555.4359978.1748472767597@mail.yahoo.com>
Subject: [PATCH RFC] drivers/hid/hid-wiimote: Improve Wiimote Balance Board
 input reporting
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <170711555.4359978.1748472767597.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.23884 YMailNovation

Hi all,

Although the balance board is reportedly fairly accurate and not significan=
tly affected by heavy use, https://www.sciencedirect.com/science/article/ab=
s/pii/S0966636213003184, a few projects aiming to use Wii Balance Board as =
weighing scales question its accuracy for weights below 10 or 20 kilograms =
e.g: https://github.com/jmahmood/bbev and https://github.com/SilverLuke/PC-=
Fit.

The kernels' hid-wiimote module's current implementation provides 'cooked' =
weight sensor values in decigrams (units of 10 grams) derived by interpolat=
ing 'raw' sensor values between 0, 17 and 34kg calibration values. For sens=
or values higher than 34kg extrapolation continues to use the higher, 17 an=
d 34 kg, calibration points. However, for sensor values below the 0kg calib=
ration points the driver simply returns a fixed bottom limit of 0, and ther=
ein lies the problem.

Based on a sample of 2 balance boards, absolute sensor values from old and =
battered balance boards can have positive or, and crucially, negative offse=
ts in excess of 1kg relative to their original calibrations. E.g. if a sens=
or has a -1.5kg offset the kernel module will report 0 for that sensor unti=
l the balance board is loaded by about 6 kg since each sensor 'sees' roughl=
y a quarter of the total weight on the board.

A more subtle consideration is that the current implementation uses simple =
integer division in its interpolation calculations which on average will ro=
und
down the summed total of the four sensor values by 20 grams.=20

Even more subtly, the Wii Balance Board's stiffness varies by around 1% for=
 every 14=C2=B0C temperature change, https://wiibrew.org/wiki/Wii_Balance_B=
oard. However, the current wiimote hid driver doesn't use the balance board=
's temperature sensor or reference temperature calibration point.

Lastly, there is a small adjustment that Wii Fit is said to make that may b=
e to normalise to Standard Gravity. This scales the whole result by a facto=
r of ~0.99908.

While none of this is a problem for applications that are only concerned wi=
th relative values, e.g. games and COP (centre of pressure) applications, i=
t is for
for me because I want reliable, absolute measurements of relatively small w=
eights to monitor my small breed pet dogs at home.

My proposed patches addresses each of these issues
1) Report 'negative' weights
=C2=A0=C2=A0=C2=A0 Benefit: The balance board can be used by applications t=
o weigh objects down to 0 kg no matter how battered they are.
=C2=A0=C2=A0=C2=A0 Consideration: Any weighing scales application will need=
 a 'zeroing' facility to accommodate for any offsets from balance board cal=
ibration points.
=C2=A0=C2=A0=C2=A0 Risk: May break existing applications that cannot handle=
 negative sensor values.
2) Use the Kernel's DIV_ROUND_CLOSEST macro
=C2=A0=C2=A0=C2=A0 Benefit: Improved accuracy.
=C2=A0=C2=A0=C2=A0 Consideration: Uses more CPU time, code bloat.
=C2=A0=C2=A0=C2=A0 Risk: none?
3a) Perform compensation for temperature and gravitational acceleration
=C2=A0=C2=A0=C2=A0 Benefit: Improved accuracy
=C2=A0=C2=A0=C2=A0 Consideration: Uses more CPU time, code bloat.
=C2=A0=C2=A0=C2=A0 Risk: none?
3b) Report calibration reference temperature for use by user-space applicat=
ions to
=C2=A0=C2=A0=C2=A0 /sys/bus/hid/drivers/wiimote/<dev>/bboard_ref_temp
=C2=A0=C2=A0=C2=A0 Benefit: Improved accuracy (user-space applications)
=C2=A0=C2=A0=C2=A0 Consideration: Uses more CPU time, code bloat.
=C2=A0=C2=A0=C2=A0 Risk: none?

Testing: Having made these proposed changes to the kernel's hid-wiimote mod=
ule, and dealing with the 'zeroing' issue in user-land, I can use my balanc=
e board to weigh both of my dogs, measurements are within 10-20 grams of th=
ose made by my veterinary practitioner's scales, and to weigh myself with m=
easurements within 100 grams of my bathroom scales. As an independent verif=
ication I weighed 8 bottles of wine individually using kitchen scales put t=
hem on each of the 2=C2=A0 Wii Balance Boards available to me and got the e=
xpected result :-)

Thank you for your consideration,
Sophie.

Here follows a patch that can be applied against v6.15, commit 0ff41df (I h=
ope I've done things correctly):

---
=C2=A0drivers/hid/hid-wiimote-modules.c | 144 +++++++++++++++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++++++++++++--------------
=C2=A0drivers/hid/hid-wiimote.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0 1 +
=C2=A02 files changed, 130 insertions(+), 15 deletions(-)

diff --git a/drivers/hid/hid-wiimote-modules.c b/drivers/hid/hid-wiimote-mo=
dules.c
index dbccdfa63916..67bf0fed062a 100644
--- a/drivers/hid/hid-wiimote-modules.c
+++ b/drivers/hid/hid-wiimote-modules.c
@@ -1302,8 +1302,30 @@ static const struct wiimod_ops wiimod_classic =3D {
=C2=A0 * Some 3rd party devices react allergic if we try to access normal W=
ii Remote
=C2=A0 * hardware, so this extension module should be the only module that =
is loaded
=C2=A0 * on balance boards.
- * The balance board needs 8 bytes extension data instead of basic 6 bytes=
 so
- * it needs the WIIMOD_FLAG_EXT8 flag.
+ * The balance board has 11 bytes extension data instead of basic 6 bytes =
so
+ * it needs the WIIMOD_FLAG_EXT16 flag.
+ *
+ * The stiffness of the Wii Fit's sensors decreases with temperature which
+ * causes them to indicate higher than actual weight at high temperature a=
nd
+ * and lower than actual weight at low temperature. The net effect is abou=
t
+ * a 1% error for a difference of 14 in the balance board's temperature se=
nsor
+ * reading compared to a reference temperature. Wii Fit compensates for th=
e
+ * temperature value with the calculation:=20
+ * (.999 * total_weight * -(.007 * ((board_temp - ref_temp) / 10.0) - 1.0)=
)
+ * where 0.999 is actually 0.9990813732147217 (0x3feff87980000000) and .00=
7 is
+ * actually 0.007000000216066837 (0x3f7cac0840000000, (double).007f).
+ *
+ * To do the same using integer maths we must refactor to subtract fractio=
ns.
+ * For the temperature compensation part we subtract a 1429th of the senso=
r
+ * value multiplied by the temperature difference (1/(0.007/10)), then
+ * subtract a 1089th of that value for the overall adjustment (1/(1-0.9990=
8)).
+ *
+ * The refactored equation for each sensor is:
+ * final_weight =3D compensated_weight - (compensated_weight / 1089)
+ * where
+ * compensated_weight =3D sensor_weight - ( temp_diff * sensor_weight / 14=
29)
+ * and
+ * temp_diff =3D board_temp - ref_temp
=C2=A0 */
=C2=A0
=C2=A0static void wiimod_bboard_in_keys(struct wiimote_data *wdata, const _=
_u8 *keys)
@@ -1316,7 +1338,7 @@ static void wiimod_bboard_in_keys(struct wiimote_data=
 *wdata, const __u8 *keys)
=C2=A0static void wiimod_bboard_in_ext(struct wiimote_data *wdata,
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 const __u8 *ext)
=C2=A0{
-=C2=A0=C2=A0=C2=A0 __s32 val[4], tmp, div;
+=C2=A0=C2=A0=C2=A0 __s32 val[4], tmp, div, temp_diff, temp_corr, scale_cor=
r;
=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int i;
=C2=A0=C2=A0=C2=A0=C2=A0 struct wiimote_state *s =3D &wdata->state;
=C2=A0
@@ -1337,10 +1359,24 @@ static void wiimod_bboard_in_ext(struct wiimote_dat=
a *wdata,
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0=C2=A0 7=C2=A0=C2=A0 |=C2=A0 Bo=
ttom Left <15:8>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0=C2=A0 8=C2=A0=C2=A0 |=C2=A0 Bo=
ttom Left=C2=A0 <7:0>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0 -----+------------------------=
--+
+=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0=C2=A0 9=C2=A0=C2=A0 |=C2=A0 Tempera=
ture=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |
+=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0 -----+--------------------------+
+=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0 10=C2=A0=C2=A0 |=C2=A0 NOT USED=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |
+=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0 -----+--------------------------+
+=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0 11=C2=A0=C2=A0 |=C2=A0 Battery=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |
+=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0 -----+--------------------------+
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *
-=C2=A0=C2=A0=C2=A0=C2=A0 * These values represent the weight-measurements =
of the Wii-balance
+=C2=A0=C2=A0=C2=A0=C2=A0 * The first 8 bytes represent the weight-measurem=
ents of the Wii-balance
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * board with 16bit precision.
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *
+=C2=A0=C2=A0=C2=A0=C2=A0 * Temperature values less than the calibration re=
ference temperature
+=C2=A0=C2=A0=C2=A0=C2=A0 * indicate that that sensors are stiffer and cons=
equently produce lower
+=C2=A0=C2=A0=C2=A0=C2=A0 * readings.
+=C2=A0=C2=A0=C2=A0=C2=A0 *
+=C2=A0=C2=A0=C2=A0=C2=A0 * A battery level =E2=89=A5 0x82 is 4 bars, less =
than 0x82 and =E2=89=A5 0x7D is 3 bars,
+=C2=A0=C2=A0=C2=A0=C2=A0 * less than 0x7D and =E2=89=A5 0x78 is 2 bars, le=
ss than 0x78 and =E2=89=A5 0x6A is 1
+=C2=A0=C2=A0=C2=A0=C2=A0 * bar, and otherwise is considered empty.
+=C2=A0=C2=A0=C2=A0=C2=A0 *=20
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * The balance-board is never reported interl=
eaved with motionp.
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
=C2=A0
@@ -1360,23 +1396,52 @@ static void wiimod_bboard_in_ext(struct wiimote_dat=
a *wdata,
=C2=A0=C2=A0=C2=A0=C2=A0 val[3] <<=3D 8;
=C2=A0=C2=A0=C2=A0=C2=A0 val[3] |=3D ext[7];
=C2=A0
+=C2=A0=C2=A0=C2=A0 temp_diff =3D ext[8] - s->calib_bboard_temp;
+
=C2=A0=C2=A0=C2=A0=C2=A0 /* apply calibration data */
=C2=A0=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < 4; i++) {
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (val[i] <=3D s->calib_bboard=
[i][0]) {
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tmp =3D=
 0;
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else if (val[i] < s->calib_bb=
oard[i][1]) {
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Interpolate using 0 and=
 17kg datum points when sensor values are
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * less than their 17kg ca=
libration points.
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (val[i] < s->calib_bboard[i]=
[1]) {
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tm=
p =3D val[i] - s->calib_bboard[i][0];
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tmp *=
=3D 1700;
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Divi=
sor used for interpolation */
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 di=
v =3D s->calib_bboard[i][1] - s->calib_bboard[i][0];
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tmp /=
=3D div ? div : 1;
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Interpolate using 17 an=
d 34kg datum points when sensor values are
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * equal to or greater tha=
n their 17kg calibration points.
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tm=
p =3D val[i] - s->calib_bboard[i][1];
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tmp *=
=3D 1700;
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 di=
v =3D s->calib_bboard[i][2] - s->calib_bboard[i][1];
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tmp /=
=3D div ? div : 1;
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tmp +=
=3D 1700;
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Add =
17kg, the delta between 0 and 17kg datum points. */
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tmp +=
=3D s->calib_bboard[i][1] - s->calib_bboard[i][0];
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val[i] =3D tmp;
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * 1,700 is the factor for=
 interpolating between calibration points,
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * which are 17kg apart, t=
o achieve 0.01kg steps. This multiplication
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * also helps to mitigate =
the effect of rounding errors introduced in
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * subsequent division cal=
culations.
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tmp *=3D 1700;
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Apply temperature compe=
nsation of approximately -0.98% for every
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * 14 units of temperature=
, likely degrees C, above that at which
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * board calibration was d=
one.
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 temp_corr =3D tmp * temp_diff;
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 temp_corr =3D DIV_ROUND_CLOSEST=
(temp_corr, 1429);
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tmp -=3D temp_corr;
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Nintendo's Wii Fit is s=
aid to make this correction. Maybe it is an
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * adjustment for the spec=
ific gravitational acceleration at their
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * calibration facility to=
 normalise results to Standard Gravity.
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Subtract approximately =
0.092%.
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 scale_corr =3D DIV_ROUND_CLOSEST(tmp, 1089);
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tmp -=3D scale_corr;
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* finally divide by the delta =
between applicable calibration points*/
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val [i] =3D DIV_ROUND_CLOSEST(t=
mp, div ? div : 1);
=C2=A0=C2=A0=C2=A0=C2=A0 }
=C2=A0
=C2=A0=C2=A0=C2=A0=C2=A0 input_report_abs(wdata->extension.input, ABS_HAT0X=
, val[0]);
@@ -1464,11 +1529,43 @@ static ssize_t wiimod_bboard_calib_show(struct devi=
ce *dev,
=C2=A0
=C2=A0static DEVICE_ATTR(bboard_calib, S_IRUGO, wiimod_bboard_calib_show, N=
ULL);
=C2=A0
+static ssize_t wiimod_bboard_ref_temp_show(struct device *dev,
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct device_attribute *attr,
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 char *out)
+{
+=C2=A0=C2=A0=C2=A0 struct wiimote_data *wdata =3D dev_to_wii(dev);
+=C2=A0=C2=A0=C2=A0 int ret;
+=C2=A0=C2=A0=C2=A0 __u8 ref_temp;
+
+=C2=A0=C2=A0=C2=A0 ret =3D wiimote_cmd_acquire(wdata);
+=C2=A0=C2=A0=C2=A0 if (ret)
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
+
+=C2=A0=C2=A0=C2=A0 ret =3D wiimote_cmd_read(wdata, 0xa40060, &ref_temp, 1)=
;
+=C2=A0=C2=A0=C2=A0 if (ret !=3D 1) {
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wiimote_cmd_release(wdata);
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret < 0 ? ret : -EIO;
+=C2=A0=C2=A0=C2=A0 }
+
+=C2=A0=C2=A0=C2=A0 wiimote_cmd_release(wdata);
+
+=C2=A0=C2=A0=C2=A0 spin_lock_irq(&wdata->state.lock);
+=C2=A0=C2=A0=C2=A0 wdata->state.calib_bboard_temp =3D ref_temp;
+=C2=A0=C2=A0=C2=A0 spin_unlock_irq(&wdata->state.lock);
+
+=C2=A0=C2=A0=C2=A0 ret =3D 0;
+=C2=A0=C2=A0=C2=A0 ret +=3D sprintf(&out[ret], "%02x\n", ref_temp);
+
+=C2=A0=C2=A0=C2=A0 return ret;
+}
+
+static DEVICE_ATTR(bboard_ref_temp, S_IRUGO, wiimod_bboard_ref_temp_show, =
NULL);
+
=C2=A0static int wiimod_bboard_probe(const struct wiimod_ops *ops,
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct wiimote_data *wdata)
=C2=A0{
=C2=A0=C2=A0=C2=A0=C2=A0 int ret, i, j;
-=C2=A0=C2=A0=C2=A0 __u8 buf[24], offs;
+=C2=A0=C2=A0=C2=A0 __u8 buf[24], offs, ref_temp;
=C2=A0
=C2=A0=C2=A0=C2=A0=C2=A0 wiimote_cmd_acquire_noint(wdata);
=C2=A0
@@ -1482,6 +1579,11 @@ static int wiimod_bboard_probe(const struct wiimod_o=
ps *ops,
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wiimote_cmd_release(wdata)=
;
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret < 0 ? ret : -EI=
O;
=C2=A0=C2=A0=C2=A0=C2=A0 }
+=C2=A0=C2=A0=C2=A0 ret =3D wiimote_cmd_read(wdata, 0xa40060, &ref_temp, 1)=
;
+=C2=A0=C2=A0=C2=A0 if (ret !=3D 1) {
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wiimote_cmd_release(wdata);
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret < 0 ? ret : -EIO;
+=C2=A0=C2=A0=C2=A0 }
=C2=A0
=C2=A0=C2=A0=C2=A0=C2=A0 wiimote_cmd_release(wdata);
=C2=A0
@@ -1494,6 +1596,7 @@ static int wiimod_bboard_probe(const struct wiimod_op=
s *ops,
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 of=
fs +=3D 2;
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
=C2=A0=C2=A0=C2=A0=C2=A0 }
+=C2=A0=C2=A0=C2=A0 wdata->state.calib_bboard_temp =3D ref_temp;
=C2=A0
=C2=A0=C2=A0=C2=A0=C2=A0 wdata->extension.input =3D input_allocate_device()=
;
=C2=A0=C2=A0=C2=A0=C2=A0 if (!wdata->extension.input)
@@ -1506,6 +1609,13 @@ static int wiimod_bboard_probe(const struct wiimod_o=
ps *ops,
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto err_free;
=C2=A0=C2=A0=C2=A0=C2=A0 }
=C2=A0
+=C2=A0=C2=A0=C2=A0 ret =3D device_create_file(&wdata->hdev->dev,
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 &dev_attr_bboard_ref_temp);
+=C2=A0=C2=A0=C2=A0 if (ret) {
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hid_err(wdata->hdev, "cannot cr=
eate sysfs attribute\n");
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto err_free;
+=C2=A0=C2=A0=C2=A0 }
+
=C2=A0=C2=A0=C2=A0=C2=A0 input_set_drvdata(wdata->extension.input, wdata);
=C2=A0=C2=A0=C2=A0=C2=A0 wdata->extension.input->open =3D wiimod_bboard_ope=
n;
=C2=A0=C2=A0=C2=A0=C2=A0 wdata->extension.input->close =3D wiimod_bboard_cl=
ose;
@@ -1542,6 +1652,8 @@ static int wiimod_bboard_probe(const struct wiimod_op=
s *ops,
=C2=A0err_file:
=C2=A0=C2=A0=C2=A0=C2=A0 device_remove_file(&wdata->hdev->dev,
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 &dev_attr_bboard_calib);
+=C2=A0=C2=A0=C2=A0 device_remove_file(&wdata->hdev->dev,
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 &dev_attr_bboard_ref_temp);
=C2=A0err_free:
=C2=A0=C2=A0=C2=A0=C2=A0 input_free_device(wdata->extension.input);
=C2=A0=C2=A0=C2=A0=C2=A0 wdata->extension.input =3D NULL;
@@ -1558,10 +1670,12 @@ static void wiimod_bboard_remove(const struct wiimo=
d_ops *ops,
=C2=A0=C2=A0=C2=A0=C2=A0 wdata->extension.input =3D NULL;
=C2=A0=C2=A0=C2=A0=C2=A0 device_remove_file(&wdata->hdev->dev,
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 &dev_attr_bboard_calib);
+=C2=A0=C2=A0=C2=A0 device_remove_file(&wdata->hdev->dev,
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 &dev_attr_bboard_ref_temp);
=C2=A0}
=C2=A0
=C2=A0static const struct wiimod_ops wiimod_bboard =3D {
-=C2=A0=C2=A0=C2=A0 .flags =3D WIIMOD_FLAG_EXT8,
+=C2=A0=C2=A0=C2=A0 .flags =3D WIIMOD_FLAG_EXT16,
=C2=A0=C2=A0=C2=A0=C2=A0 .arg =3D 0,
=C2=A0=C2=A0=C2=A0=C2=A0 .probe =3D wiimod_bboard_probe,
=C2=A0=C2=A0=C2=A0=C2=A0 .remove =3D wiimod_bboard_remove,
diff --git a/drivers/hid/hid-wiimote.h b/drivers/hid/hid-wiimote.h
index 9c12f63f6dd2..fd31797b4b06 100644
--- a/drivers/hid/hid-wiimote.h
+++ b/drivers/hid/hid-wiimote.h
@@ -136,6 +136,7 @@ struct wiimote_state {
=C2=A0
=C2=A0=C2=A0=C2=A0=C2=A0 /* calibration/cache data */
=C2=A0=C2=A0=C2=A0=C2=A0 __u16 calib_bboard[4][3];
+=C2=A0=C2=A0=C2=A0 __u8 calib_bboard_temp;
=C2=A0=C2=A0=C2=A0=C2=A0 __s16 calib_pro_sticks[4];
=C2=A0=C2=A0=C2=A0=C2=A0 __u8 pressure_drums[7];
=C2=A0=C2=A0=C2=A0=C2=A0 __u8 cache_rumble;

