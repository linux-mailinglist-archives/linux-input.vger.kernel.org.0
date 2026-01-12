Return-Path: <linux-input+bounces-16977-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4AAD13581
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 15:56:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5BD0030E75E4
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 14:33:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 652322EBBAA;
	Mon, 12 Jan 2026 14:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aol.com header.i=@aol.com header.b="dx8JhFS+"
X-Original-To: linux-input@vger.kernel.org
Received: from sonic317-26.consmr.mail.bf2.yahoo.com (sonic317-26.consmr.mail.bf2.yahoo.com [74.6.129.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8EF29A312
	for <linux-input@vger.kernel.org>; Mon, 12 Jan 2026 14:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.6.129.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768228189; cv=none; b=ILPMKT+mca/KvYw/QZXXRXlPq068Q3+y99T5ybwnsFQ0PXnQdyQRk11azmq2nWJZICwRJObt6IYqWLXrXtUX3PSU5MAqxjAqJz9QXFPQagfIgZX9ofr+/r09549BV4EMjWFqhPaRO7Mq9e2LBtTJaNnHh7JMUx5s9jN5oKccJMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768228189; c=relaxed/simple;
	bh=Xmxm42/LwMeruibasB+M0tP6H/CUdxk1Cdg+Grn9nX4=;
	h=Content-Type:From:Mime-Version:Date:Subject:Message-Id:To:
	 References; b=OGNC8dCyc/82zw74+jor+IRO93T1nobGDkkxQtzkDP4KRuYNxJXHxJtHi3mc5o6Bm4MpVGWpeo6OcGDjzmu68WCpJLY0Mfe16NRAlBxDqLDbv9k19JtoDD+j01xmyzwJVGXvAgHq8V0crDwjnHH8wOBP8a0+ybD7lxRRVeJT87g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=aol.com; spf=pass smtp.mailfrom=aol.com; dkim=pass (2048-bit key) header.d=aol.com header.i=@aol.com header.b=dx8JhFS+; arc=none smtp.client-ip=74.6.129.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=aol.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aol.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1768228186; bh=Xmxm42/LwMeruibasB+M0tP6H/CUdxk1Cdg+Grn9nX4=; h=From:Date:Subject:To:References:From:Subject:Reply-To; b=dx8JhFS+reRylHWxtsxRUlvFvCaWTwqyrBFo8EhUGaa6RaTALjSVgR+/5E9wQwl4Om26g9e9kSH/iwjW77RZBBUGW9jExejVsxBnTxPD7zFMVxmwyBb1dXVsjCcvjSgRO6NEZPZtaLowcwE65FBR98fXg+MeUJqctv397P73nmwbOTfvpKtFKtETBNQdtzxHcLJK8f06d3nka+61l+cqCAfzLcfAtM7FbR0nXrnvNfoOt+KP0sVPZjfbLBtkWDzSwbLd/pkfYJSK0bhaNiImWqRnmnY7ksdAjeBYoWACg388ujDJpcwhNwP6jBaJCIGQ0NUSWYrgKmV6tCyEJMMIDQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1768228186; bh=ESbWHqOq9qdpFDYT4LupntInrr1mX3kQl8ohQ8+s3w3=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=KmS8s/GYpOL9awMEQ+FtRwO05SIQ0R+7cbpsoGUZWO/b7J1JVgc4Zf91LBRD6R/y8kqlAmUkbVcPvMCZD38nFDiEAuvUdurVf6NpHovSxOft1rpJ+GPbJnln7/d8v6IhhCbj6atH3m8oklf61cCv466DWa3SOTZVLAV1xvp5vti0y95U6ndSkguQAfvSwe/yQZCKJnR4IlEQ8ZIA0WCiF3/cJq1YTzRUz9eqwftqtdgxay8CLR8KP7SnxHWp5rbtD2JKhkJ80TWpA0Lxpug4rjj6KKwj4Lg/YsyO0hX2extSOC8GtAOtZxelndzB4MxfTB9G4uaxWpMTGAsVTI1f0g==
X-YMail-OSG: Gcwp5IQVM1lUz2ryOPh9acc1HS9FimpiFxh.4EBRp9OkCWfenYIyqepULEi8WM_
 RDukG23M7vtqfkfpYDYx18u0GCr1d71MI0vTQSTW7tBrEVanYpg0b9063PDCTdy9mGxmN.KZgBN_
 g4fYXVOgP.q4ozrXXPr21BlDd_.zwJYIMPI9Vt4yMhCenR9Ay9iqEVD7RxrA5wRFSY3AjpCyxghk
 5KRYQ9lInY9NTqIadkhz4L_wGZQo42qDzOhWMt3jV.qUpU1WifIC2TXpZU3zLor3toPoVNNHAJbz
 5PWLCh.BNbJGRON.c2rB5Gcx5uACoW0OSOVpbTsrIEjiIcDQ_5pk3HPxqz_au4SA7fd81bi08W3U
 TSsgK770RvivJ5dAtvayFhOHwB4M3_977ww_cqVScwDa_cLow1WPl99.6t4v6C5oXFLvsrYvEN25
 ck5JkIRckJ0mU.7ZP5pTWZZYUdYNyovLioQTaa4t2LWO1IhjEyeb5C5afGuPTIZR3M90HnByM.b8
 aA41O6_UUU4iz0YL0IMKZnRFWTevclywycR859L3RFSadLwT7pGO.vKLIAmuM8_nRpcmQ2t6VMhf
 0wd0UDILGqAY70EnqY1SNAJQuODFXALsZCIfcf1bX9v7iBcS5pxHS8.B9nTZ_g2ECOMmKN_GifAD
 rh3Bbj3peZrI5mjSC0iT5aPtNusYe83LoZuruDzLQRYOrCUel9I._DUlBO.okpFbr1qXg5Zi9gPo
 .ENLaewujSAmrEWiS0jTLUO1mI7PZUXyZxtDn2eNnADncsZWC.z7fQhOZCrmDNTevvphcLixEjFn
 V174fRcIakyHjfOEbxyK7YpYiAYce_c.QGiZbdhkGzcHvQQtLH.RIza8wY0N18SqQX8X1xNM7Sm9
 oZhUXd.QjQzoUzey8cb6o4xLKwMfay2.mP34Nrw39Ld7zYpYufCc8wpNL7uAmUBmiU1_tlUJVUGQ
 yTdbL0Uf8xBwuYfWK4App0UBd65nIJnqB.CcAJv28z2F6VxpucxLyqTB1AEm89IqZvFQt9iCSFr3
 Ah3NjJkwwMgumXmwoKopfNEeN7RgVIVAvkO7oWuvEmV_VQBuoT1tsGJa4Yrrj4Pk.Wb46I7Eoy_d
 9.l25MU6qyGB8RaocV_m2QsbJ0aMOxTo8MfRdQobJDTJOH5c2BtGoEWeckEgcvDMDJX1oT4duPLe
 66hZEOXAyGcYUsEUublEnsonA3xAoCohO3euqLNSuag.1qOlhgnkENbAuz7TNcnzz5De8Di99rV.
 rJGD0Y8zm7kMl_0G5LbD0MGzqZ98LOiZzU3ViGEcX324yPcjAsb7BtiD0Cyz2RiF3AuBwPQpuPjP
 gzPq6QbwkDCHxH4b78LZ7ACfrIvh4bZxkC8biXcsKClL7wBz927AiF5J.NzGcABGFD8XChoJgm4Q
 NhEgRpDZF7_0sGK0smu23ydaUF9XErFSH6vgc5f08JPx9CVbh1eJrI0oAgIhNkR0dw1X.JvfhiTj
 468fj36W570QatHeMc0bXiST4efgGa.5xnMP_UThBFlzbuh2K64ZCScPMil17cjVBS7ZK8EQVqNQ
 b5w75xqr0GvoNqltW6kcaKugMSbVWi7O6FbnV_K2oHNtVSXOgiu.LPeI26mAYTzpeXRwJA0EQqHp
 C2SpYia0r8EGqI18we1Nhv1Lf76_v0DVFcX1BJOeeCTVi1fUcFL93fuN8UMkNZs30gvNfmHv5_CR
 yxAZwaqlKGDfsnJDg3eiyM1oit9aXp4pqRIkcPCSrwAQH5T0jL4x1MAVWeeYmuzheXp1bArazgHE
 hci3OuCwlSw.lB35HPxo4up_XSKyV8Zv3KhJH4n5FLrHyFEDzduLckl1xpzLGyAgajHPow6qUPcj
 HTTLGCeIjDmc4kMUgiAyfu0nCJ0ThbtjHNIO4uraK27De6AoMVTAvuJEH9c6ZTYlNgn6RVFFx_6b
 iUvXvznS.qbLV.5E9kAD3.3LUO7shy8ceolbNbd5od8ujspYjjOrF1l639BSewru2acrLJ3lzhRx
 bLT9xU77M9cXFzzixDVVKG0jC0nzy2ggPF9CxAaW_4KOhFo9xX0NzjROt8KLp81DGMwAexBEqKH9
 mxFtHG8Tcm4XP4331HKC29SSk6A4KDCw7XRaaa4IBrpzyutf3h55SfVTYxIuXKV27GTZqmgcLKtF
 VwnHBMNumqaeuznoOjmXW8O5_sSrvZzBtkxgRWUzCatypo4vfkFQ4.Lz1roxgJpV97iKuzFLTCKt
 3hGysSaBXLILh_47OxnKuzEXamgHbIXV4mbC_6wGMqo5HT390ZeGx1q9NP4O_CQ--
X-Sonic-MF: <pgarym@aol.com>
X-Sonic-ID: 19847259-7f57-4aad-84b1-a65e1dceb7ff
Received: from sonic.gate.mail.ne1.yahoo.com by sonic317.consmr.mail.bf2.yahoo.com with HTTP; Mon, 12 Jan 2026 14:29:46 +0000
Received: by hermes--production-ir2-6fcf857f6f-wrvmf (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID a0a986b30c22f15559d0dcc974dfddd4;
          Mon, 12 Jan 2026 13:49:16 +0000 (UTC)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
From: Paul MORRIS <pgarym@aol.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Date: Mon, 12 Jan 2026 13:49:04 +0000
Subject: Subscribe Linux-input
Message-Id: <5EB0F81A-202E-4FBC-9018-326E896D286C@aol.com>
To: linux-input@vger.kernel.org, majordomo@vger.kernel.org
X-Mailer: iPhone Mail (22H217)
References: <5EB0F81A-202E-4FBC-9018-326E896D286C.ref@aol.com>

Subscribe Linux-input

Regards


