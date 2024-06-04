Return-Path: <linux-input+bounces-4086-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D58E8FBA06
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2024 19:10:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB05D282225
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2024 17:10:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80177149C62;
	Tue,  4 Jun 2024 17:10:01 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from exchange.fintech.ru (exchange.fintech.ru [195.54.195.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DFD1149018;
	Tue,  4 Jun 2024 17:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.54.195.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717521001; cv=none; b=tXSmmVvGqrsG3aysISimoahyMscj7DVLOAVOZz0MfEzM5bNBe5GONiFYB+dagJL03OT5TwCBkSvJ6bReVop17B/R8+VBCCXlHXMpjKXji9Hh1tC+TVgFxrqx3xQlg6+3RHxxkXfRjnc16S/6/E2Sn0XlyYowbxArLM7U2BQlpLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717521001; c=relaxed/simple;
	bh=Igv2VV4mugXViOwO29eD/sNySNWKwLk2QAVjhhx/zuI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Ri2A89e7/aODHxrLbTozshDjYYM7QpR/Svcd5+8izG5+7nPtFLDNp8FF3DpP+wnFW/klgN0cOZICfGA56MADIZuR/gjq9CHoEseYM31kTg5pG6tTrNtFCQRRy5iMJRHM8OYc2shhXZWuLWjdu34jtKxY418hKhkRbaLvPcEpXhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fintech.ru; spf=pass smtp.mailfrom=fintech.ru; arc=none smtp.client-ip=195.54.195.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fintech.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fintech.ru
Received: from Ex16-01.fintech.ru (10.0.10.18) by exchange.fintech.ru
 (195.54.195.169) with Microsoft SMTP Server (TLS) id 14.3.498.0; Tue, 4 Jun
 2024 20:09:47 +0300
Received: from [192.168.211.130] (10.0.253.138) by Ex16-01.fintech.ru
 (10.0.10.18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 4 Jun 2024
 20:09:47 +0300
Message-ID: <2a38e355-af5c-4b3d-81be-0cc97376c1f5@fintech.ru>
Date: Tue, 4 Jun 2024 10:09:43 -0700
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] HID: usbhid: fix recurrent out-of-bounds bug in
 usbhid_parse()
To: Jiri Kosina <jikos@kernel.org>, Kees Cook <kees@kernel.org>
CC: Benjamin Tissoires <bentiss@kernel.org>, Kees Cook
	<keescook@chromium.org>, <linux-usb@vger.kernel.org>,
	<linux-input@vger.kernel.org>, <syzkaller-bugs@googlegroups.com>,
	<linux-kernel@vger.kernel.org>,
	<syzbot+c52569baf0c843f35495@syzkaller.appspotmail.com>,
	<linux-hardening@vger.kernel.org>
References: <20240524120112.28076-1-n.zhandarovich@fintech.ru>
 <nycvar.YFH.7.76.2406041015210.16865@cbobk.fhfr.pm>
 <E62FA5CB-D7AE-4A11-9D2E-7D78D7C10ADA@kernel.org>
 <nycvar.YFH.7.76.2406041614210.24940@cbobk.fhfr.pm>
Content-Language: en-US
From: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
In-Reply-To: <nycvar.YFH.7.76.2406041614210.24940@cbobk.fhfr.pm>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: Ex16-02.fintech.ru (10.0.10.19) To Ex16-01.fintech.ru
 (10.0.10.18)

Hi,

On 6/4/24 07:15, Jiri Kosina wrote:
> On Tue, 4 Jun 2024, Kees Cook wrote:
> 
>> This isn't the right solution. The problem is that hid_class_descriptor 
>> is a flexible array but was sized as a single element fake flexible 
>> array:
>>
>> struct hid_descriptor {
>> 	   __u8  bLength;
>> 	   __u8  bDescriptorType;
>> 	   __le16 bcdHID;
>> 	   __u8  bCountryCode;
>> 	   __u8  bNumDescriptors;
>>
>> 	   struct hid_class_descriptor desc[1];
>> } __attribute__ ((packed));
>>
>> This likely needs to be: 
>>
>> struct hid_class_descriptor desc[] __counted_by(bNumDescriptors);
>>
>> And then check for any sizeof() uses of the struct that might have changed.
> 
> Ah, you are of course right, not sure what I was thinking. Thanks a lot 
> for catching my brainfart.
> 
> I am dropping the patch for now; Nikita, will you please send a refreshed 
> one?
> 

Thanks for catching my mistake.

I'll gladly send a revised version, hoping to do it very soon.

Regards,
Nikita

