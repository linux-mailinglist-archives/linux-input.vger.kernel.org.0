Return-Path: <linux-input+bounces-13334-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92885AF1090
	for <lists+linux-input@lfdr.de>; Wed,  2 Jul 2025 11:50:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 496874809C6
	for <lists+linux-input@lfdr.de>; Wed,  2 Jul 2025 09:49:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76B322475C2;
	Wed,  2 Jul 2025 09:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="f71292rU"
X-Original-To: linux-input@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429FD182D0;
	Wed,  2 Jul 2025 09:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751449774; cv=none; b=kDRCVSB80un8puYF8v9fLp8wuE4USFWmRzaigcP64hM7pdFSBPJbxq/RqmLdshO4F4YQ5AbxkkyDZy3wFhsa497SG9ubzwYlfjvrwrBQyxF5Oz9Bvalt8M2S0PxYFufiT7eoGdF9HZbLWeQglyU14Y6RicvgswcKz3+wv0FXMzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751449774; c=relaxed/simple;
	bh=HaDbrpXJ0lT6/Xsy0anDOjZM40zt+N8qVQXlMq+igkE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cl78CUXTiHn23Vs2mOfV8fk+1Pz1s8Pj/kUNsCndupldpqXvt2b771fZLv9EAvgHy+jnRd+NfloTB0v7CjrsRCfJOtP871pvgczy4wd84/Q8s/+VdtFKNUbmU91lnlNJf0jg+sAgfJfvEm7lLd0/MKQQdMmdox5YTmCd+9T3qVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=f71292rU; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751449770;
	bh=HaDbrpXJ0lT6/Xsy0anDOjZM40zt+N8qVQXlMq+igkE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=f71292rUHg3WI4fUSBFc+KK9z9UY3VGWxdv3y3c+UbrfUwDm0DZ74NzaasxZy7qey
	 b3I3owP50H3fZzi3SJ/tS8dGG9hayAu8pc6ytIHBEP1L3yBw53cQTwvYO6C1mC4i7g
	 Bzqfz8X5QGCOZeiBFF1BBsAlIYdp72hhMFRdR6UFV6ndoOJR0MUONKuknnN3y4PZfl
	 I2hBSlW1TOHwYjd5hg52TmWTB3r0jqeJbyNnYgPvtM6nIXHUcXiMXtUj+V/qLeK7z7
	 Q3s1LLUIXPYiCXHFQuITvmgx72/frRdzu88TA86x1ot0zUb94rh3GIr4gUfFD4XdOG
	 t3Uju+CuhRIqg==
Received: from [192.168.1.90] (unknown [212.93.144.165])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BE03B17E04C0;
	Wed,  2 Jul 2025 11:49:29 +0200 (CEST)
Message-ID: <422d8ca6-00b6-4c69-b261-b0399d12c9d8@collabora.com>
Date: Wed, 2 Jul 2025 12:49:29 +0300
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: rockchip: add analog audio to ROCK 4D
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20250630-rock4d-audio-v1-0-0b3c8e8fda9c@collabora.com>
 <20250630-rock4d-audio-v1-3-0b3c8e8fda9c@collabora.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20250630-rock4d-audio-v1-3-0b3c8e8fda9c@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/30/25 1:19 PM, Nicolas Frattaroli wrote:
> The RADXA ROCK 4D, like many other Rockchip-based boards, uses an ES8388
> analog audio codec. On the production version of the board, the codec's
> LOUT1 and ROUT1 pins are tied to the headphone jack, whereas pins LOUT2
> and ROUT2 lead to a non-populated speaker amplifier that itself leads to
> a non-populated speaker jack. The schematic is still haunted by the
> ghosts of those symbols, but it clearly marks them as "NC".
> 
> The 3.5mm TRRS jack has its microphone ring (and ground ring) wired to
> the codec's LINPUT1 and RINPUT1 pins for differential signalling.
> 
> Furthermore, it uses the SoCs ADC to detect whether the inserted cable
> is of headphones (i.e., no microphone), or a headset (i.e., with
> microphone). The way this is done is that the ADC input taps the output
> of a 100K/100K resistor divider that divides the microphone ring pin
> that's pulled up to 3.3V.
> 
> There is no ADC level difference between a completely empty jack and one
> with a set of headphones (i.e., ones that don't have a microphone)
> connected. Consequently headphone insertion detection isn't something
> that can be done.
> 
> Add the necessary codec and audio card nodes. The non-populated parts,
> i.e. LOUT2 and ROUT2, are not modeled at all, as they are not present on
> the hardware.
> 
> Also, add an adc-keys node for the headset detection, which uses an
> input type of EV_SW with the SW_MICROPHONE_INSERT keycode. Below the
> 220mV pressed voltage level of our SW_MICROPHONE_INSERT switch, we also
> define a button that emits a KEY_RESERVED code, which is there to model
> this part of the voltage range as not just being extra legroom for the
> button above it, but actually a state that is encountered in the real
> world, and should be recognised as a valid state for the ADC range to be
> in so that no "closer" ADC button is chosen.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Enabled CONFIG_SND_SOC_ES8328_I2C and confirm playback works fine:

    $ speaker-test -D hw:ES8388,0 -F S16_LE -c 2 -t wav

Unfortunately the recording doesn't seem to be functional:

    $ arecord -D hw:ES8388,0 -f S16_LE -c 2 -r 48000 -d 5 -V stereo /tmp/test.wav
    Recording WAVE '/tmp/test.wav' : Signed 16 bit Little Endian, Rate 48000 Hz, Stereo
                                    +00%|00%+

    $ aplay -D hw:ES8388,0 /tmp/test.wav

However, the headset plug detection works correctly:

    $ evtest
    No device specified, trying to scan all of /dev/input/event*
    Available devices:
    /dev/input/event0:	Logitech USB Receiver
    /dev/input/event1:	Logitech USB Receiver Mouse
    /dev/input/event2:	Logitech USB Receiver Consumer Control
    /dev/input/event3:	Logitech USB Receiver System Control
    /dev/input/event4:	adc-keys
    Select the device event number [0-4]: 4
    Input driver version is 1.0.1
    Input device ID: bus 0x19 vendor 0x1 product 0x1 version 0x100
    Input device name: "adc-keys"
    Supported events:
      Event type 0 (EV_SYN)
      Event type 1 (EV_KEY)
      Event type 5 (EV_SW)
        Event code 4 (SW_MICROPHONE_INSERT) state 0
    Properties:
    Testing ... (interrupt to exit)
    Event: time 1751449448.185340, type 5 (EV_SW), code 4 (SW_MICROPHONE_INSERT), value 1
    Event: time 1751449448.185340, -------------- SYN_REPORT ------------
    Event: time 1751449448.289477, type 5 (EV_SW), code 4 (SW_MICROPHONE_INSERT), value 0
    Event: time 1751449448.289477, -------------- SYN_REPORT ------------
    Event: time 1751449449.329482, type 5 (EV_SW), code 4 (SW_MICROPHONE_INSERT), value 1
    Event: time 1751449449.329482, -------------- SYN_REPORT ------------

Tested-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>


