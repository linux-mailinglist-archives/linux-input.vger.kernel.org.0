Return-Path: <linux-input+bounces-204-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E83447F4A0F
	for <lists+linux-input@lfdr.de>; Wed, 22 Nov 2023 16:17:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 254E81C203BB
	for <lists+linux-input@lfdr.de>; Wed, 22 Nov 2023 15:17:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C90292574D;
	Wed, 22 Nov 2023 15:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hF4nUseY"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2410812A
	for <linux-input@vger.kernel.org>; Wed, 22 Nov 2023 07:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700666227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HNZF0SqnqKoxtxQfSsYiCYBkXnRbbx9Gogs3wh0979A=;
	b=hF4nUseY1sn4eYrWfUD9lQu31uau0ThYLNQeZU+5INFaB3XmWNYCV8vwZGbeAiaqGI8/ia
	gMM+MJcb2EEwtkuz3xPRCAnS8P2ETfq4vBGeIIJj0208McivEGVv9OChdT4t4m158Kkd0v
	DsoMkjM4SIPtFn4ajD4UosBzd1zMBzg=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-527-PDzlG0wbM5K1dBrc7bkaKQ-1; Wed, 22 Nov 2023 10:17:04 -0500
X-MC-Unique: PDzlG0wbM5K1dBrc7bkaKQ-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-50aa9aee5f9so4229988e87.3
        for <linux-input@vger.kernel.org>; Wed, 22 Nov 2023 07:17:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700666223; x=1701271023;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HNZF0SqnqKoxtxQfSsYiCYBkXnRbbx9Gogs3wh0979A=;
        b=kjqxWzEvjlNxYFQmFEaDi1IDukn/+M0i3d3N7s5d44o6rgUQ5MewUcA0RjkuwpAEoL
         vF74mKQDLHfS6+vpmjh7AkCY0iFBWjDYmm9iJL8nSwaZ1TrUi2Gn8SCcYG+Q3vviy175
         seSCeDLRZmCLN7cKywizpKrLJcCp2hzRROaexe6E843Qi9m80tfDHn6XMtDBB5cH8nWt
         INqQzGUTBntPJRl3v6TjePY9R01+HrrPayzyqtb1S9Ollo9lKezqBLkjq1C5E0X4Kwad
         +ZrqlwDijixUEuYu3fPUkFCXmt2x8qdTXlmzyraOTe6sNFMRF1lSPsHqX3mpKQe7q5NN
         fuiA==
X-Gm-Message-State: AOJu0YxblO8pWsGF0R9MYJUdNOXnNLU6ior3wFgCfeM6EhH00Y89x4PY
	yCv2vHhO8EbrLxXwmYx375oZHl7++zSAdp7OyhaPL1Y1pJ9xLKwhj8+A3scjtAvtmuSRS0bojl6
	S0N5TNw8wXSUiNgezSnpLj6Gj1H2gJlU=
X-Received: by 2002:a19:f818:0:b0:509:8e22:ae5 with SMTP id a24-20020a19f818000000b005098e220ae5mr1804416lff.60.1700666223055;
        Wed, 22 Nov 2023 07:17:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGhNkk8osKUkuMiPV2p7kvM34eDJmsK95p+FLf/21RrBimt6NwiyXB5Qui/5kgPXgAMHMEmbw==
X-Received: by 2002:a19:f818:0:b0:509:8e22:ae5 with SMTP id a24-20020a19f818000000b005098e220ae5mr1804397lff.60.1700666222725;
        Wed, 22 Nov 2023 07:17:02 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id u10-20020aa7d88a000000b00548ac1f7c5esm4002104edq.64.2023.11.22.07.17.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Nov 2023 07:17:02 -0800 (PST)
Message-ID: <0e3cd2e2-ea09-4772-88ed-b90a913937a0@redhat.com>
Date: Wed, 22 Nov 2023 16:17:01 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Input: i8042 - add quirk for Lenovo ThinkPad T14 Gen 1
Content-Language: en-US, nl
To: Jonathan Denose <jdenose@chromium.org>
Cc: linux-input@vger.kernel.org, Jonathan Denose <jdenose@google.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>, Takashi Iwai
 <tiwai@suse.de>, Werner Sembach <wse@tuxedocomputers.com>,
 linux-kernel@vger.kernel.org
References: <20230925163313.1.I55bfb5880d6755094a995d3ae44c13810ae98be4@changeid>
 <fbcf0fee-b97d-8f47-9df4-44bc1b475144@redhat.com>
 <CALNJtpUH_0+ETa+7MfKRbpc_c1TTTasUrZ4zA4V9EHb_BtAUwg@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CALNJtpUH_0+ETa+7MfKRbpc_c1TTTasUrZ4zA4V9EHb_BtAUwg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Jonathan,

On 11/21/23 21:23, Jonathan Denose wrote:
> Hello Hans,
> 
> On Tue, Sep 26, 2023 at 5:37 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi,
>>
>> On 9/25/23 23:33, Jonathan Denose wrote:
>>> The ThinkPad T14 Gen 1 touchpad works fine except that clicking
>>> and dragging by tapping the touchpad or depressing the touchpad
>>> do not work. Disabling PNP for controller setting discovery enables
>>> click and drag without negatively impacting other touchpad features.
>>>
>>> Signed-off-by: Jonathan Denose <jdenose@google.com>
>>
>> Thanks, patch looks good to me:
>>
>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>>
>> Regards,
>>
>> Hans
> 
> I just wanted to double check that I haven't missed anything, has this
> patch been applied yet?

Dmitry unfortunately does not have a lot of time for
reviewing / merging input subsystem patches. So AFAICT this
has not been processed / merged yet.

I've just send Dmitry a friendly worded email ping for another
patch, I've also brought this patch to his attention in
that email.

Regards,

Hans



