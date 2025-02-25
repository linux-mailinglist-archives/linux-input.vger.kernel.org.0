Return-Path: <linux-input+bounces-10311-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 930DAA433BA
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 04:41:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 18C7718968D7
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 03:40:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6698624CED6;
	Tue, 25 Feb 2025 03:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="iF9iqF5I"
X-Original-To: linux-input@vger.kernel.org
Received: from terminus.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B96242912;
	Tue, 25 Feb 2025 03:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740454819; cv=none; b=tOxmGkDYcy/je214/o7eMIXkgj8xvGTCsAJYhnabekgcWaFxCH6eluKDFjN9yYGZaNAqtZcOM/e6LEH5i/7gZDIhF187ugjL0mIhK8rSPRdG2cZVB9VWyVWnOuN9dN4T4UzaQSOnXvcZdu0Bf8vCdIwdw8lpz6Cpn1YskCgE0u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740454819; c=relaxed/simple;
	bh=qJuy0nK2q6YCUlorfPoA1uGhIzEe0LfAfeiGmFKmujU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l6I6aJyqp12dgdp4fK0A+SJCajV6XuJuc5ajjDVqpMRw5RwboP8Blz/UCCEiKFyFPkvlM4Ja7tldkfsdTEL6BNo+gb/V4Vqp0JGhfM1eBOy3zvfTZhq+CELWQLdQKcKWl7LC0Jmi3eRJwwl++RzwqTX5Nj1T4nsrSrbMtzqiJNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=iF9iqF5I; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Received: from [172.27.1.176] ([76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 51P3aPQT1061652
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Mon, 24 Feb 2025 19:36:26 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 51P3aPQT1061652
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025021701; t=1740454597;
	bh=ISdSv8V44MsbYhNsZikfbFNm2jh7tbbEZwA+56mURdo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iF9iqF5IJij6HEIYPvvetQ6+tmIzHsh+pMTMVnu3P5ykEhZfImV1libD4devCmagC
	 3iyNSk1XFew7r8nfwrcPOMDwT9Cet01bBs8IAXImpdZtFUNL3xujHc86QVgJiUt4X2
	 0obQOYiKlDxXVK9eiAHHN4J1RQO+t4f6a/s1DU/qIj/jceKMbtNss8wjpWMLBt7Ymh
	 YFL/VhabUdylO/46/55nX8FOwHbYthWKv8154FTojDQ/TbamsE3xTiQ8D2e6xanXYX
	 Oq30jBmkXfmGEjBRSmTsnad5TAIoXsXj3RQH1SppbmnJ0+TSzbTmjlZvJzSgp8i1Fw
	 p0rBDMFAbZAag==
Message-ID: <d0067e6a-a6af-4b38-ac72-f655af4d3b3d@zytor.com>
Date: Mon, 24 Feb 2025 19:36:25 -0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/17] x86: Replace open-coded parity calculation with
 parity8()
To: Uros Bizjak <ubizjak@gmail.com>
Cc: Kuan-Wei Chiu <visitorckw@gmail.com>, tglx@linutronix.de,
        Ingo Molnar <mingo@redhat.com>, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, jk@ozlabs.org,
        joel@jms.id.au, eajames@linux.ibm.com, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, rfoss@kernel.org,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
        dmitry.torokhov@gmail.com, mchehab@kernel.org, awalls@md.metrocast.net,
        hverkuil@xs4all.nl, miquel.raynal@bootlin.com, richard@nod.at,
        vigneshr@ti.com, louis.peens@corigine.com, andrew+netdev@lunn.ch,
        davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
        parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
        johannes@sipsolutions.net, gregkh@linuxfoundation.org,
        jirislaby@kernel.org, yury.norov@gmail.com, akpm@linux-foundation.org,
        mingo@kernel.org, alistair@popple.id.au, linux@rasmusvillemoes.dk,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, kuba@kernel.org,
        linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
        dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
        linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
        oss-drivers@corigine.com, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
        brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org,
        bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
        Yu-Chun Lin <eleanor15x@gmail.com>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
 <20250223164217.2139331-4-visitorckw@gmail.com>
 <d080a2d6-9ec7-1c86-4cf4-536400221f68@gmail.com>
 <e0b1c299-7f19-4453-a1ce-676068601213@zytor.com>
 <CAFULd4a_AnP4iqgQs7a6xAsnUFL8oZXxFcAWLmZFMm6MPF_zDQ@mail.gmail.com>
Content-Language: en-US
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <CAFULd4a_AnP4iqgQs7a6xAsnUFL8oZXxFcAWLmZFMm6MPF_zDQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2/24/25 14:08, Uros Bizjak wrote:
> On Mon, Feb 24, 2025 at 10:56 PM H. Peter Anvin <hpa@zytor.com> wrote:
>>
>> On 2/24/25 07:24, Uros Bizjak wrote:
>>>
>>>
>>> On 23. 02. 25 17:42, Kuan-Wei Chiu wrote:
>>>> Refactor parity calculations to use the standard parity8() helper. This
>>>> change eliminates redundant implementations and improves code
>>>> efficiency.
>>>
>>> The patch improves parity assembly code in bootflag.o from:
>>>
>>>     58:    89 de                    mov    %ebx,%esi
>>>     5a:    b9 08 00 00 00           mov    $0x8,%ecx
>>>     5f:    31 d2                    xor    %edx,%edx
>>>     61:    89 f0                    mov    %esi,%eax
>>>     63:    89 d7                    mov    %edx,%edi
>>>     65:    40 d0 ee                 shr    %sil
>>>     68:    83 e0 01                 and    $0x1,%eax
>>>     6b:    31 c2                    xor    %eax,%edx
>>>     6d:    83 e9 01                 sub    $0x1,%ecx
>>>     70:    75 ef                    jne    61 <sbf_init+0x51>
>>>     72:    39 c7                    cmp    %eax,%edi
>>>     74:    74 7f                    je     f5 <sbf_init+0xe5>
>>>     76:
>>>
>>> to:
>>>
>>>     54:    89 d8                    mov    %ebx,%eax
>>>     56:    ba 96 69 00 00           mov    $0x6996,%edx
>>>     5b:    c0 e8 04                 shr    $0x4,%al
>>>     5e:    31 d8                    xor    %ebx,%eax
>>>     60:    83 e0 0f                 and    $0xf,%eax
>>>     63:    0f a3 c2                 bt     %eax,%edx
>>>     66:    73 64                    jae    cc <sbf_init+0xbc>
>>>     68:
>>>
>>> which is faster and smaller (-10 bytes) code.
>>>
>>
>> Of course, on x86, parity8() and parity16() can be implemented very simply:
>>
>> (Also, the parity functions really ought to return bool, and be flagged
>> __attribute_const__.)
>>
>> static inline __attribute_const__ bool _arch_parity8(u8 val)
>> {
>>          bool parity;
>>          asm("and %0,%0" : "=@ccnp" (parity) : "q" (val));
> 
> asm("test %0,%0" : "=@ccnp" (parity) : "q" (val));
> 
> because we are interested only in flags.
> 

Also, needs to be %1,%1 (my mistake, thought flags outputs didn't count.)

Finally, this is kind of an obvious improvement:

  static void __init sbf_write(u8 v)
  {
         unsigned long flags;

         if (sbf_port != -1) {
-               v &= ~SBF_PARITY;
                 if (!parity(v))
-                       v |= SBF_PARITY;
+                       v ^= SBF_PARITY;

	-hpa


