Return-Path: <linux-input+bounces-15636-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E261BF7F8C
	for <lists+linux-input@lfdr.de>; Tue, 21 Oct 2025 19:52:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 049E34E7564
	for <lists+linux-input@lfdr.de>; Tue, 21 Oct 2025 17:52:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 854DC34C149;
	Tue, 21 Oct 2025 17:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.es header.i=@yahoo.es header.b="o2PiCeBX"
X-Original-To: linux-input@vger.kernel.org
Received: from sonic313-21.consmr.mail.ir2.yahoo.com (sonic313-21.consmr.mail.ir2.yahoo.com [77.238.179.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E21B3557F1
	for <linux-input@vger.kernel.org>; Tue, 21 Oct 2025 17:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.238.179.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761069119; cv=none; b=hVYasjIMYnAZ+wYkrrptkfssEgo+P4adenz82pnVZcgzjU1mBAFsg/bvnxYJg/OfrX8PB8RYDG9SXuCUNM7B3VdbpuR9AIrWU3x4pYtBEpRrICJMiSn3imhR4U7edjXHf9gnYgnU6cFvGifU4ZVALYGpV8rrpUa0S3cJ/M4Diho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761069119; c=relaxed/simple;
	bh=c+HScNeQrKbmkWTDX98J4xfkTgy0u4Xybmf/j8HugsY=;
	h=Message-ID:Date:From:MIME-Version:To:CC:Subject:Content-Type:
	 References; b=Zz5VqC0i7ybRmm990qK/YcEEu8lBE0pU0DBVMI/ZYLnwq+1xHOXsKVgluukHSzMRj81Ylbc/HA7PkNn6dH+2NplknNTRV4rZI5VTkgeU+qKPDIeneQC/Y+BylGtxnxY/Z3Zxrefc4+BBJYQbLWyl3HtQwG0obrSm8t7oGtdkALQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.es; spf=pass smtp.mailfrom=yahoo.es; dkim=pass (2048-bit key) header.d=yahoo.es header.i=@yahoo.es header.b=o2PiCeBX; arc=none smtp.client-ip=77.238.179.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.es
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.es
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.es; s=s2048; t=1761069115; bh=p3x5k4Sry8UPbWz7NfPvbhB5J9+j0/KIaCbBO8Xx8TQ=; h=Date:From:Reply-To:To:CC:Subject:References:From:Subject:Reply-To; b=o2PiCeBXMryafiqkmsCgo0JvloWAWhAmEKKgxPXVBl0zhSjvsbaEjKcwLY32s8ek/WC252Ulxegx5+LcjU6+BgnDJ/VZOJVFWAfpjd+Yr6cGLTDSf6GF6AWAJXkw5rK0zL8poD0Ria/JcLUArvzV/Vr50zqKkAC0SDbnVhBwk2Om/24G5rEa99aAbzzQJne6FJwaYekqWXBqRJ3VYLe1ul6WRJ+/rT4lS+vZ5NOfUHL2DmoHL8ZqzYq8zN6kaXnrOPTH+bNGGzFbGvRfGeLomE8sKtFlRkvWqE1ium6RFc2n6C76/B0j4oWfHbAjYlJBbqgm15exqVn7HRlvx8g1QQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1761069115; bh=pDTy2q4cJFYT9FvgwP56FOcX/etavNsrfjvS5X0JHAo=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=ZdYpoMcJbTv69V0mMkp2OV+bw6dXRoyDhiX5LZ01ZK1EegHO8JhJfuH0qQtIGDQVrYAUbAV0HO+au869yQbsq8nU4fMQ27IKW+mzDqxVLuBrB4SgsBaPgPqteeB31GRvFPTmxEBBVIpv6BZXi8IFyLguRW1+9D1Nhn1/UDG59N/bCs+St3C/NGb8RQto6L9bTbHF1V3KtOa61tj6XKqD/CvttY+X0TRdHgWzs14TL0hf5gcfktjdk5L2vz7DUmXwG6ojvxwXiGTe68p7fgDf62paaw4VaORfIJ9w+o3OyjvxzuME5Cy3n/BH0s0iNBpriK3iGeBStxz/zf4K7Jn7EQ==
X-YMail-OSG: CHy9nWkVM1nkKzFV0KQyAhjhB_XUidrow6AJEQoEd5sU9TKMwlBmf16jFJ4LI4x
 kbIUNiK141kfrD9Va3omKXyW_jFvTLvRPd3veWF.DOJOPHSu.EgO9i28N443syaifdsJQYVI.CbU
 C_k_8cnDX9C98QqxR2hDAsfjCZLng7F3HoqTdXttB_ExmAyTwiKEIluscBa6vsiPOZybjB48E1Z1
 P7doT12l3m7T7PEqdfaG7L4ZKLGn6W_HGQ5Ob3sDOu8FY2yHiufWsNSTAg4XeUQH3CQ2Uwy.Lpd1
 Q0iPASa72YmL8A1swLj72dPnlNyabCS5Rllq6DzAtwhLMqx4kmOb1QaUYnbYBlkQoKSGRl7Nxy1_
 lHa2KuWwFX9aZNu.jbZj1n1U6DhT9Ysc0VnEbL_cXM7W.JVi_pCobsckS.7qqq09hXEZkEwuwXVj
 jSOka9jmx0hSMAZmTVdv59yBXVL97jr.NkDusHFHw_aG8FHtz8GaEIA7HuIyGK97s7VZk2X2V2w_
 neIVxRNAHpjZd5GcR_WEWNQwGa2eWC6.kdv5WfBZek126I_oJAmsqVDfSJRwmAbv8B5vd8p5nu3y
 z.SpXz8X8zYi5dmUWR4kpSbSE5fYUDmyyuImyDcCxz6Jr76UXkse9LnJOQl3sqwBjkkO1UzJz5VH
 FpnHzo0clxngWzFzoRs53O6JZlEgohzHhQRVUzmF4KQ465Vxkbin3uLRgqrwhzr6gXX_XxHB1J2Z
 1VB7FZM70zxh2SJGtmjwvER8HhBP6oDOW0GdV9Zb75iSBOIumDR4D_6cmPNKGuHL1Tj_gmIkJPLA
 2FGse11EduDamMdN4ojQPdOUqbmwn_enU30eYlpb9uv0qpOZGRdnw5sUAQ7eXHPIyq0qJv2QHI4W
 hP4e0U_fyg24gGd10Laxo7DoURwTiIXIFH3trc8ysx3FDilIPZ.FTIsq7ZWZZYI.aDVTDwWCCPE7
 RnL5RwZ7KWCsGFsax6lOzkBdsupRU8rGoS6p0oKYWjyCIdxjAjejWe4TNddgEBgFazTxwgi4fq4m
 0VqYymssb.0MrrjwBY5N3FyjgIpQCMHCUFqme.tolctvzMJ66nkFvTvSxDinTMw0jeIFaCmTh5bX
 uLHBcutLkPs_jOLxSMmQxPC4OMvW4vuVZJToHTD0DxsLLYHcpyrg5p4NKDNyp1Y4h2gpnoaWckJC
 m0IOAecZElDyZyLHPJEbUhyp7AGl2zPquQjs9chzFOZsbnjER1YPcYti20zRhGGTVSqLreUV3dj0
 zNNU1DF_qwjERu7Hqyb4Q0E6_Drf0hUQ5J9sP6Mjt2xMqFUIb1YqOMOGNyQ2k9bj49eoi0.NCiyU
 nTwc5mfKDcGkbq2pClkvfVtO4pEIbwwO4rQxMmeSOUYK7UW8UvGIU6btiQWjgpUwkSgkbSTzverv
 PEmbxvVskb95nKR2lYFtc2tP544pkL0z7hy272ADwcC_JaYXQGEi9DnvxWNknZVyH1FDCcJ7Ajdn
 WTF0eg2YbQNqNcpwgZczpHF8tFw31vB.KCGrelhtzGhJ2yU3_JrT8jwxBpul7RyU8EbHbx9NZBNg
 kM0pPNbSUt1A3Ow0Ln0w0SM4mvtj39QcSyXZQNlendH7hUcP7CQ8AQKEHiWpW0AdyomQcSccxCJe
 PmgLPIWCc6e8neh32BtGjYLb0gxcmLj5AunqKbYiD0VZdV.Qiy43yXdYYSkl1TIQojqZ3MJkZZq5
 .LPVC0Mz2bT.vH0wKwOaT3VpTlqp3YdoE1XfDZpLkNNZfv93zqtTFgBQ7dOZEJCGnYR2xscGQrP1
 hLfRiVb8V2I809eiWcTdv5Rm7KQKB8_p_XOoIvxzblPaoPF7GU.y4iPfRRRjtS2_0du38.7Lj9me
 85NwlrR9J9B10wlzggUUEhXvNUvyLV_HOvVya001FJ52lhDZ7drANUi5v6RKCGRiSa3XNLK6xFI4
 zWZ6NUQn2EtlWR4HFryIRnfv.CkoCiA8xgId91qO242gggpuF6iGHhkZlbkD4bmz43muDEn4sh3i
 H9cfsVxMluPRdrFxp6y_st02bwJI3bDfcpTR9uzXtXIPnD8S1rMvzld5pGb0BxES_ekckvO9EEpO
 iJ9sZ2ebxOM8UOlwkyv.DR4ggl4T9CgzfXI94KFzvbcfI96hsr8IrrrJgznaa1V8g1iUqrb4dxWS
 Ewe99bJeku2Gak4I3zxrKeuHG6z0ftCSlUZpVqJTzLiGfdPzXLLsLWxPiM.jDPB4x5tL7DElG8.y
 NLcfnjXXI2JSyPK2y4FFGMQ0UYdbeP70i8UwVr4MmeOIGBgKZOPkzX6B2x3.kcQnr37309pcQyw9
 cu01bslwdg0G6roh8Vim46ZyCIB1k5J95LA--
X-Sonic-MF: <melus0@yahoo.es>
X-Sonic-ID: 120b8b36-341b-4291-b086-42bf262d4224
Received: from sonic.gate.mail.ne1.yahoo.com by sonic313.consmr.mail.ir2.yahoo.com with HTTP; Tue, 21 Oct 2025 17:51:55 +0000
Received: by hermes--production-ir2-cdb597784-5nnrf (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 3104a9fd11f08fd80492248de79ef4ed;
          Tue, 21 Oct 2025 17:21:31 +0000 (UTC)
Received: from luis2 (luis2.eb7gwl.ampr.org [192.168.1.252])
	by sirius.eb7gwl.ampr.org (8.13.1/8.12.8) with SMTP id 59LHLSVS005280;
	Tue, 21 Oct 2025 19:21:28 +0200
Message-ID: <68F7C063.5049@yahoo.es>
Date: Tue, 21 Oct 2025 19:18:27 +0200
From: Luis Yanes <melus0@yahoo.es>
Reply-To: melus0@yahoo.es
X-Mailer: Mozilla 3.04Gold (WinNT; U)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
To: linux-input@vger.kernel.org
CC: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Subject: [PATCH] Off-by-one error in CP2112 HID driver affecting SMBus block read output
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
References: <68F7C063.5049.ref@yahoo.es>

Affected file: drivers/hid/hid-cp2112.c
Kernel version: v5.15.195 (verified) - master (suspected)
Tool used: i2cget -y 8 0xb 0x78 s <-- reading a battery gauge chip

Observed behavior:
Incorrect trailing last byte in 32 bytes SMBus block read response.

Expected output:
0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xaa
0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0x55

Actual SMBus block data read output:
0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xaa
0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0x00

I2C block data read output (from i2cget -y 8 0xb 0x78 i):
0x20 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff
0xaa 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff

Description:
When performing an SMBus block read using the CP2112 HID USB-to-SMBus
bridge with the i2cget utility, the last byte of the response for a
32 bytes block read is, in this case, always 0x00 instead of the actual
value. In this sample case shown above the actual last byte is 0x55 but
the driver returns 0x00 (uninitialized value).
This happens consistently for any 32 bytes block read on any register.
Shorter than 32 bytes block transfers are unaffected.

Suspected cause:
For what I could understand checking the source code this seems an
off-by-one error in the read request and buffer handling, limited by the
I2C_SMBUS_BLOCK_MAX 32 bytes read value and the response parsing logic
within the CP2112 driver since that with a custom hacked module
(see patch below) I could read that last byte.

Steps to reproduce:
1. Connect a CP2112 device and a proper slave device to read from.
2. Use i2cget to perform a known 32 bytes block read with this device:
   i.e: i2cget -y 8 0xb 0x78 s
3. Compare the output against the expected data from the target
   SMBus device. The last byte probably could appear as any other
   uninitialized buffer value, I guess.
   From 'i2cget -y 8 0xb 0x78 i' the initial 0x20 is the block
   length and the last 32th byte is completely missing.

Impact:
This bug produces incorrect output and will lead to data corruption
or data misinterpretation when reading from SMBus devices using this
driver.

Suggested fix:
Review the buffer handling and read length in the CP2112 driver SMBus
and I2C block read and write implementations.
I have not checked if write operations are affected, but probably would
be a good idea to verify that the 32 bytes block transfers are handled
properly.

Additional info:
The issue is reproducible with different CP2112 devices (silicon rev F04)
and v5.15.x stock kernel builds. Probably also affects newer versions
since for what I could understand, despite the additional checking
changes added to the driver the logic seems basically the same.

Patch: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/plain/drivers/hid/hid-cp2112.c?h=v5.15.195
--- a/drivers/hid/hid-cp2112.c
+++ b/drivers/hid/hid-cp2112.c
@@ -703,7 +703,7 @@
 	case I2C_SMBUS_BLOCK_DATA:
 		if (I2C_SMBUS_READ == read_write) {
 			count = cp2112_write_read_req(buf, addr,
-						      I2C_SMBUS_BLOCK_MAX,
+						      I2C_SMBUS_BLOCK_MAX + 1,
 						      command, NULL, 0);
 		} else {
 			count = cp2112_write_req(buf, addr, command,
@@ -796,7 +796,7 @@
 		memcpy(data->block + 1, buf, read_length);
 		break;
 	case I2C_SMBUS_BLOCK_DATA:
-		if (read_length > I2C_SMBUS_BLOCK_MAX) {
+		if (read_length > I2C_SMBUS_BLOCK_MAX + 1) {
 			ret = -EPROTO;
 			goto power_normal;
 		}

--


