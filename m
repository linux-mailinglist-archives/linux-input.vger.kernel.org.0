Return-Path: <linux-input+bounces-14056-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC68B29010
	for <lists+linux-input@lfdr.de>; Sat, 16 Aug 2025 20:24:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DE2C34E06CF
	for <lists+linux-input@lfdr.de>; Sat, 16 Aug 2025 18:24:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 922B51FAC4E;
	Sat, 16 Aug 2025 18:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="VjgkORfj"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166EE15C15F;
	Sat, 16 Aug 2025 18:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755368657; cv=none; b=Ta+UYtpMr1RUQF5ky6pLbOcBYIL5PK40xHdOmcICrqkv+iYVR52Rw4F1+j9AuU+QCj/lgCn8OICwJiZIm9r1PJluW/6r1AyokGdkRHBU3H7R12bsxVShjWCagfyP9IIupRwpGPw2bZ2hK4LuFc9dDO3Bqyacf+bzoOv/EQvwos8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755368657; c=relaxed/simple;
	bh=6O5N523WCTyTWnot0VxJfp/vgZYIQmHEvO5kzCfgTIg=;
	h=Content-Type:Message-ID:Date:MIME-Version:From:Subject:To:Cc; b=YQbvrHu2b/rcqKKsm7vs5B+pk7pwNvBSQtDkiO0KM5JFutlcHn3MW8PjCsFv/r/6LXDFRfy2FSkBHbRyDB9fm2Y5whW9tl0dBU2VK6/X4fmZR/+ulZ9pzcBsE6Z+BOT7D6Y9h7kLlfTgpfRn0/Y3L5tuscOMlwUvDZFqPTpwOBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=VjgkORfj; arc=none smtp.client-ip=212.27.42.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Received: from [IPV6:2001:861:57c6:79d0:a4eb:e0da:cdee:91bc] (unknown [IPv6:2001:861:57c6:79d0:a4eb:e0da:cdee:91bc])
	(Authenticated sender: tomben13@free.fr)
	by smtp4-g21.free.fr (Postfix) with ESMTPSA id CFA9419F576;
	Sat, 16 Aug 2025 20:24:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1755368651;
	bh=6O5N523WCTyTWnot0VxJfp/vgZYIQmHEvO5kzCfgTIg=;
	h=Date:From:Subject:To:Cc:From;
	b=VjgkORfjyUOqlEoIaGFF4Dc5CnrUpziHHX1UKQXi+vWHiQoFp2JqkjkprastBgygm
	 Rkvkyfql5Mlobth7Q5uVoVrp23Tz+i8AgRLZpfOvF++1NmEX14lCDls1H+wuubzpeZ
	 U1JBLnzEbY20ULAQigzKmWbHB0G9ad/ECPjjM/4ckocVThczfWdfwZ5cU8QsaPZ8xg
	 XellSPqX0UPtVAJkhTG95zWczY/kvRSPB1ft2To6tNny47IhaWXkaDVB2vn1faEuaj
	 NG44sCF8/bZ6i8rdKMqIvwiztRUpzCuuZXGUkMm/xqVpBSDxccIYYcxwSzo5/vXodi
	 6aE7wuCEYy8eQ==
Content-Type: multipart/mixed; boundary="------------hRjbDyTg7mLmLz3i4cN3lQN3"
Message-ID: <afab2e44-ff31-4b3f-bfd8-0d5b184423c4@free.fr>
Date: Sat, 16 Aug 2025 20:24:10 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Tom Benham <tomben13@free.fr>
Subject: [Bug][Patch] /dev/input/jsX absent for Nintendo Switch Pro controller
To: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Content-Language: en-US

This is a multi-part message in MIME format.
--------------hRjbDyTg7mLmLz3i4cN3lQN3
Content-Type: multipart/alternative;
 boundary="------------LWzMZnYUId0q1ZdOaJUOuGtQ"

--------------LWzMZnYUId0q1ZdOaJUOuGtQ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

First and foremost, apologies if this report is not properly done or 
formatted or whatever regarding the kernel development process. Feel 
free to correct me if I did something wrong.

Distribution: ArchLinux

|$ cat /proc/version
Linux version 6.16-arch2-1 (linux@archlinux) (gcc (GCC) 15.2.1 20250813, 
GNU ld (GNU Binutils) 2.45.0) #3 SMP PREEMPT_DYNAMIC Sat, 16 Aug 2025 
16:19:12 +0000
|
Problem description:
When plugging a Nintendo Switch Pro controller, the |/dev/input/js0| 
file does not get created.

Problem analysis:
I think I have pinpointed the bug in the hid-nintendo.c driver.

  * joydev (who is responsible for creating |/dev/input/js0|) is not
    handling the device.
  * However, joydev receives the handling request from input.c only for
    the IMU device (the accelerometer), which is blacklisted (totally
    normal) so we get the following message when activating debug
    messages in joydev:
      o |input input39: joydev: blacklisting 'Nintendo Co., Ltd. Pro
        Controller (IMU)'|
  * joydev is looking for |absbit| and |keybit| in order to match a
    device (defined in |joydev_ids| array)
  * But for the regular device (not IMU), |absbit| and |keybit| are 0
  * The reason is that in |joycon_input_create|, |input_register_device|
    is called BEFORE setting the bits (which happen in |joycon_config_*|)
  * This change was introduced in commit
    94f18bb19945915fcdfd1903841020ef1b6af44a
  * Before that, |input_register_device| was called AFTER setting the bits
  * So, possible regression ? I can't test with older kernels unfortunately

I attached the simple patch that works for me.

Would it also make sense to move the rumble config before the call to 
|input_register_device| ? It was moved after the IMU device creation in 
the same commit, although I am not sure if it NEEDS to be. Let me know 
what you think of that.

Unrelated to the bug but I noticed during my testing that when first 
plugging the controller, when the hid_nintendo module is not loaded, 
hid-generic handles it but then it gets disconnected right after and 
hid_nintendo takes over. I'm very new to kernel debugging so I don't 
know if this behavior is normal but I guess it is. What's funny is that 
because hid-generic doesn't have the same bug, the |/dev/input/js0| 
device gets created and then immediately removed. You can see it if you 
|ls| continuously the |/dev/input| folder. This was very confusing at 
first !

--------------LWzMZnYUId0q1ZdOaJUOuGtQ
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>First and foremost, apologies if this report is not properly done
      or formatted or whatever regarding the kernel development process.
      Feel free to correct me if I did something wrong.</p>
    <p>Distribution: ArchLinux</p>
    <p><code>$ cat /proc/version<br>
        Linux version 6.16-arch2-1 (linux@archlinux) (gcc (GCC) 15.2.1
        20250813, GNU ld (GNU Binutils) 2.45.0) #3 SMP PREEMPT_DYNAMIC
        Sat, 16 Aug 2025 16:19:12 +0000<br>
      </code> <br>
      Problem description:<br>
      When plugging a Nintendo Switch Pro controller, the <code>/dev/input/js0</code>
      file does not get created.</p>
    <p>Problem analysis:<br>
      I think I have pinpointed the bug in the hid-nintendo.c driver.</p>
    <ul>
      <li>joydev (who is responsible for creating <code>/dev/input/js0</code>)
        is not handling the device.</li>
      <li>However, joydev receives the handling request from input.c
        only for the IMU device (the accelerometer), which is
        blacklisted (totally normal) so we get the following message
        when activating debug messages in joydev:</li>
      <ul>
        <li><code>input input39: joydev: blacklisting 'Nintendo Co.,
            Ltd. Pro Controller (IMU)'</code></li>
      </ul>
      <li>joydev is looking for <code>absbit</code> and <code>keybit</code>
        in order to match a device (defined in <code>joydev_ids</code>
        array)</li>
      <li>But for the regular device (not IMU), <code>absbit</code> and
        <code>keybit</code> are 0</li>
      <li>The reason is that in <code>joycon_input_create</code>, <code>input_register_device</code>
        is called BEFORE setting the bits (which happen in <code>joycon_config_*</code>)</li>
      <li>This change was introduced in commit
        94f18bb19945915fcdfd1903841020ef1b6af44a</li>
      <li>Before that, <code>input_register_device</code> was called
        AFTER setting the bits</li>
      <li>So, possible regression ? I can't test with older kernels
        unfortunately</li>
    </ul>
    <p>I attached the simple patch that works for me.</p>
    <p>Would it also make sense to move the rumble config before the
      call to <code>input_register_device</code> ? It was moved after
      the IMU device creation in the same commit, although I am not sure
      if it NEEDS to be. Let me know what you think of that.</p>
    <p>Unrelated to the bug but I noticed during my testing that when
      first plugging the controller, when the hid_nintendo module is not
      loaded, hid-generic handles it but then it gets disconnected right
      after and hid_nintendo takes over. I'm very new to kernel
      debugging so I don't know if this behavior is normal but I guess
      it is. What's funny is that because hid-generic doesn't have the
      same bug, the <code>/dev/input/js0</code> device gets created and
      then immediately removed. You can see it if you <code>ls</code>
      continuously the <code>/dev/input</code> folder. This was very
      confusing at first !</p>
  </body>
</html>

--------------LWzMZnYUId0q1ZdOaJUOuGtQ--
--------------hRjbDyTg7mLmLz3i4cN3lQN3
Content-Type: text/x-patch; charset=UTF-8; name="hid_nintendo.patch"
Content-Disposition: attachment; filename="hid_nintendo.patch"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvaGlkL2hpZC1uaW50ZW5kby5jIGIvZHJpdmVycy9oaWQv
aGlkLW5pbnRlbmRvLmMKaW5kZXggZmI0OTg1OTg4NjE1Li5hMjE2MThiNDJjMzggMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvaGlkL2hpZC1uaW50ZW5kby5jCisrKyBiL2RyaXZlcnMvaGlkL2hp
ZC1uaW50ZW5kby5jCkBAIC0yMTM4LDEwICsyMTM4LDYgQEAgc3RhdGljIGludCBqb3ljb25f
aW5wdXRfY3JlYXRlKHN0cnVjdCBqb3ljb25fY3RsciAqY3RscikKIAljdGxyLT5pbnB1dC0+
cGh5cyA9IGhkZXYtPnBoeXM7CiAJaW5wdXRfc2V0X2RydmRhdGEoY3Rsci0+aW5wdXQsIGN0
bHIpOwogCi0JcmV0ID0gaW5wdXRfcmVnaXN0ZXJfZGV2aWNlKGN0bHItPmlucHV0KTsKLQlp
ZiAocmV0KQotCQlyZXR1cm4gcmV0OwotCiAJaWYgKGpveWNvbl90eXBlX2lzX3JpZ2h0X2pv
eWNvbihjdGxyKSkgewogCQlqb3ljb25fY29uZmlnX3JpZ2h0X3N0aWNrKGN0bHItPmlucHV0
KTsKIAkJam95Y29uX2NvbmZpZ19idXR0b25zKGN0bHItPmlucHV0LCByaWdodF9qb3ljb25f
YnV0dG9uX21hcHBpbmdzKTsKQEAgLTIxNzIsNiArMjE2OCwxMCBAQCBzdGF0aWMgaW50IGpv
eWNvbl9pbnB1dF9jcmVhdGUoc3RydWN0IGpveWNvbl9jdGxyICpjdGxyKQogCQlqb3ljb25f
Y29uZmlnX2J1dHRvbnMoY3Rsci0+aW5wdXQsIG42NGNvbl9idXR0b25fbWFwcGluZ3MpOwog
CX0KIAorCXJldCA9IGlucHV0X3JlZ2lzdGVyX2RldmljZShjdGxyLT5pbnB1dCk7CisJaWYg
KHJldCkKKwkJcmV0dXJuIHJldDsKKwogCWlmIChqb3ljb25faGFzX2ltdShjdGxyKSkgewog
CQlyZXQgPSBqb3ljb25faW11X2lucHV0X2NyZWF0ZShjdGxyKTsKIAkJaWYgKHJldCkK

--------------hRjbDyTg7mLmLz3i4cN3lQN3--

