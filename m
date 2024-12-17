Return-Path: <linux-input+bounces-8613-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E779F3F8A
	for <lists+linux-input@lfdr.de>; Tue, 17 Dec 2024 01:53:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 821891887D16
	for <lists+linux-input@lfdr.de>; Tue, 17 Dec 2024 00:53:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80C0A1B7F4;
	Tue, 17 Dec 2024 00:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="ep5AWyDv"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015D618E1F;
	Tue, 17 Dec 2024 00:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734396264; cv=none; b=MgSNe2hoHAAyrXP3x4Wy3iBILoSXH6s5SAU1+Iu3OkFTOAFtdAccckNdaSIE8zmTG3bajI2bXSUxs9JarKOU/A3UnY8n9GmpTroyhKwQd9eKmPqa53k+UWFGL3MC3R7JCiH9XJpkyZF6UMBa+3mYOxn9chyQtC59P6J9LLI06VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734396264; c=relaxed/simple;
	bh=oDYQRvF0p5X6K4YQ2N75tSTFUUvFr3NJNB1u1qSZVmk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ItkTxcW9qV/H9Cl3KuUVak3WFcevbkyKfMgal87RmP3lcUNsqHBT8pxGXU4ICKowMuJ21cTEUF34l9ARIh0zZvEjcHCkUpYjw1s5kUCr24X+feEpynp0bYco9twYDZ+LFHv7xB8leIIhmbEFY3MebOIprKsdpC1IG7wYSKEFXMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=ep5AWyDv; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1734396224; x=1735001024; i=w_armin@gmx.de;
	bh=oDYQRvF0p5X6K4YQ2N75tSTFUUvFr3NJNB1u1qSZVmk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=ep5AWyDvHXUmXIzTxYmiGHvC2Pm9hHjTLouGmpMI+1ieLPMDkB1J1jSXgl+mNRQb
	 YP2L/IV0rIiDJGiAWpV2FjccGk+BWI8PJ7UhM4ioPuFXmyVYOES3GQXdewx3OE1Xp
	 TWKWKMPJNljfKSXJS36NBkNvY8BW73GxSBUsTchSwafv12jEfdcv9RjSmKzyVEfYD
	 RjvtsnE5xl7au86UUPvSkVm0rz1IgzVw3C1nTzVkNKK+zjJSz7x1oOuMpfKfiVylR
	 HU3e1V1HbnWMae+rYrbDZWTbY+TN0GhgpX65EqpB8LjpXKhgYjggdQFkP2hpOSZW4
	 +xW8PZWDYg3H9zU8Xg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MtOGa-1tiacz3j4w-012YF8; Tue, 17
 Dec 2024 01:43:44 +0100
Message-ID: <07920e80-831e-4e2c-932e-9a5a8fe2bd3f@gmx.de>
Date: Tue, 17 Dec 2024 01:43:36 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Input: i8042 - Add support for platform filter contexts
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: o2g.org.ru@gmail.com, hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 corentin.chary@gmail.com, luke@ljones.dev, mjg59@srcf.ucam.org,
 pali@kernel.org, eric.piel@tremplin-utc.net, jlee@suse.com,
 kenneth.t.chan@gmail.com, coproscefalo@gmail.com,
 linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org, josh@joshuagrisham.com
References: <20241215233628.4500-1-W_Armin@gmx.de>
 <Z2BhjwkkysKsmhVT@google.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <Z2BhjwkkysKsmhVT@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:XtpKKqthjH2lGPuxWC2Bft842s9ZNeQ2fYfZFWGlcuDLmNWXVti
 cZ4mUDU+mkBufTHWqMavSbmNoypnF3D1pFDYZaps4nlnSA2M1/2ffFx3cCvqCcyVTG8gM+C
 mtqbCBhsw/hB13JBjN0DZZDGRgZeSvV1SYC/35fmEUjvn0TeXP+MjsRghucOg8L06ecmZEY
 bM/9mOvk6cvSrChg/1G+w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:93LTMCq2kAA=;AazR4PydoDDSwTxVw/lXRsWPcqn
 2MvRvNMdt7abAPDbqqKwv8tTCudW89qdtkBdVxwZbk/eAM1tumfLGN79BJhI6hpOf75JeX8n1
 uQK7IUOfAext42/Ojgb/Zy+Jbn2hUP/XXH67JokaukIB4b/meKARF/LAdisQ2qA4lI9RrJhVK
 9EQMqoNLcc52sbLH02tZL1SgMSxqcm1BfM3nneUCOXvWFhvZNuA7vqPNVmuDxGAUtrF4eHvvr
 PFUY9w6hCFU75cMOGUOG0DawT6xRXZHg/3Dvx+7YovE41NVibMm5GOPIoZLkJvDMpOQuNXGLQ
 Nrn1F1Z9zjpUulNZDdUW1HYKKtjdK6dT9iAs9Hqw3lyp3VZOyyscGOlu5X7LT9l31yDDRqZ84
 awNWPnzcQplA2EoRue/T63WLmaBomVQ6XpoOSeShayEWdywwWlaviaFxJcj6oM/H37PFJaa/G
 SND2Rs98INH68e2eIG/CIFavFIWuybgkaJVL6fpPuiUCOvIqdT0SauVSkT8lLDQGhTnNt8FFR
 vPzhAy+0sxL8EKdO1+Rarb2LY38/j7MHizTnCDUacJce3Yw43OPrDt46hiXBVWG6pVCUc6fMh
 PYGXUN9zOGXGAhP9n1mEI4Gc7A9JjmQ2JbgRYVCb/I6Ojdsj9C8KS15R4AOAfA73hhlORqf4Z
 bWgziH+lVodygbpbLKslA4Lu8b3N81vhO5NQ3rJI8O6RPeD1qMnMXr3V1A1XdG/jHTHhvlCGG
 ObepH0ogAhPSresh2nXufhWCM9XSAgHE6SjAWuLNd57qDzv9XKuAGg34RS/obGnY6Ad/TlvO7
 Ok0jBr7xCouj2NYLsYJTu96kiviPlsBPrT6Eek1cynMt9nB4rSAZKl1LkFjnHoDCsipEkaEbI
 mecMBayoXXczUdxNO1P/YKcOF8upHScRsJ5mtt8EjpHrxtbyl5sHwTWOLvwgPYT5sYY9LHXZH
 +f6N7UmpDR4JNfZy5oYDtzI6ALdDSGJXrv9Mrej4mqzkOQyrM3NgF3+SP5cpj1DSkqZFrBOSN
 2BF0aTfkYGk8QCCswdtrxv0mpkn6MAEQ6qneJnvL38S7ZTwxZFmUnel0IiMMGk0yhWvfh0u1G
 5e57X6736EDhKoOyAjgP1aXHWxZ0Cr

Am 16.12.24 um 18:21 schrieb Dmitry Torokhov:

> Hi Armin,
>
> On Mon, Dec 16, 2024 at 12:36:28AM +0100, Armin Wolf wrote:
>> Currently the platform filter cannot access any driver-specific state
>> which forces drivers installing a i8042 filter to have at least some
>> kind of global pointer for their filter.
>>
>> This however might cause issues should such a driver probe multiple
>> devices. Fix this by allowing callers of i8042_install_filter() to
>> submit a context pointer which is then passed to the i8042 filter.
> Right now i8042 supports only one instance of a filter, so the driver
> probing several devices will have to sort out the ownership of the
> filter anyways.
>
> Unless you plan on supporting multiple filters I do not see the need of
> storing the context in i8042. And if you decide to add support for
> multiple filters I would need to better understand the use case.
>
> Thanks.
>
I am well aware that the i8042 driver currently supports only a single platform filter.

The reason for introducing a context pointer is that otherwise drivers registering a i8042 filter
would need to provide such a global pointer for their filter themself, together with the necessary
locking since those driver can (theoretically) be instantiated multiple times.

With this patch the i8042 driver takes care of that so those driver can finally get rid of global
data structures which will break as soon as the driver is instantiated multiple times.

Additionally this new API will allow us to add support for multiple handlers later should the need
arise.

Thanks,
Armin Wolf


