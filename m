Return-Path: <linux-input+bounces-15046-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3383B98F34
	for <lists+linux-input@lfdr.de>; Wed, 24 Sep 2025 10:44:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A9292A3601
	for <lists+linux-input@lfdr.de>; Wed, 24 Sep 2025 08:44:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFFE62900A8;
	Wed, 24 Sep 2025 08:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hU6y3XHl"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9892F283FF8;
	Wed, 24 Sep 2025 08:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758703453; cv=none; b=cIgIZeo305YWgXjkrGXYoWHX3bfiwsldoTIRKPnHX85spGsqEIV3R6VZkpy2GRmakvT7cffhFHwaVWdZTG3lwMy9IYVy+C5FqmLib9/kDkIBruWmCs9ql5woTHOUn3RyYSG/79BKHr0w9W+XBFl/EibPX28oTpDu4BreC0yhMns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758703453; c=relaxed/simple;
	bh=UVMmbVL0WOh/a0kk7Cv/hmAq6hMueEkR3KeH2vwY07A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=czwSS1mkwfgA8XkB9cz/r5txeP02zrmNrYIUlj/J/PzjRBvF6j1jTcVtOGi1Bg8w2Ri7KPWMbjKr47crG1xnc8n4sRYUZ5TLxAItqZdmxsvP7GGYCKeZsnK0FwpRRQB0q74XEsPTakZyIGOvDXNO2lI1dxGKR3w1dw2YFLk2FKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hU6y3XHl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40FC6C4CEE7;
	Wed, 24 Sep 2025 08:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758703453;
	bh=UVMmbVL0WOh/a0kk7Cv/hmAq6hMueEkR3KeH2vwY07A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hU6y3XHlEzyTRC+38ejejQrXg+oKTfc3iLFAjnqG6VHjwhG3yAJx1bclVTgbzEIwu
	 My3FhxvM4x+5mKjYyP8J55OCJzwQpdjNL1vuKMUoNEIdeNjqaH8hn02WwErz06i+da
	 QjW8RyayDYcSoQMDiTRxrJ4vyVozMK2qoxcP29fAgg31LLNcL5zJrNwAzmsWKQsoDy
	 CjFobIsje9+KTBEFxIM1Oh9nUA39uhXWFqVIH5LDgKc3XdoIXzofcFP5+RmCP9BQqd
	 MA5fbaZV34Ug0FIAYX6woe+/UJnIrMmT2tDss+cHEHAJFnqN8KvIEb2mhuLKlxmZAZ
	 dzjlqXDRae6AA==
Date: Wed, 24 Sep 2025 10:44:09 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Yinon Burgansky <yinonburgansky@gmail.com>
Cc: jikos@kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: Touchpad multitouch leaves ghost fingers
Message-ID: <jm3z5dcgw66lzh5bbhnitnchbvgnvuvrzxltghrsmwtmbg76jw@rcvcyjevjrmq>
References: <CAEU-x4=Zs22b5LX_rsBVMu4BxvDfO+CZkkuWuVNaxv8mqvh9Gw@mail.gmail.com>
 <bjtev7sgmcafoysd53xrxih4nawn2dbq4odylwdglbub6td2a3@nhoxenprhjvy>
 <CAEU-x4kL45DAddmNahjR2C97+43jchpmXep++LbeP8cXLEWN-w@mail.gmail.com>
 <CAEU-x4nv3XnXchevtwN5mkVcxqnpgBobhavxZc7BjS7EgYG8Ng@mail.gmail.com>
 <c3plpgl2zsx4do2odwdeowodkkdnfqpexlwqg5a5mckyibxlge@qai35f5yeswy>
 <CAEU-x4mJiBM_zKg1DaeJkKB3W3Ay08bUTc-D3QjFjDxNiZGd0g@mail.gmail.com>
 <iav7hzeaarxifwxk7zlfnt6vipqkp4h4ldt634exlvcswz62gj@a7ongaeduylz>
 <CAEU-x4k_56w17y0DOKG2TRtegGvzVKS9USAERMa1MtO+3wZivA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEU-x4k_56w17y0DOKG2TRtegGvzVKS9USAERMa1MtO+3wZivA@mail.gmail.com>

On Sep 24 2025, Yinon Burgansky wrote:
> On Tue, Sep 23, 2025 at 7:30 PM Benjamin Tissoires <bentiss@kernel.org> wrote:
> > Got something out with https://gitlab.freedesktop.org/libevdev/udev-hid-bpf/-/merge_requests/204
> > that seems to solve your case on the hid-recorder you provided.
> 
> Thank you so much!
> The install command didn't work properly for me:
> ```
> $ ./install.sh "*DLL0945*"
> $ tree /usr/local/lib/firmware
> /usr/local/lib/firmware
> └── hid
>     └── bpf
>         └── 0011-Synaptics__DLL0945.bpf.o
> $ reboot
> $ sudo tree /sys/fs/bpf
> /sys/fs/bpf
> 0 directories, 0 files
> ```

oops, yes, my bad. I forgot to put the correct group on the device
(multitouch_win_8 instead of generic). I've force pushed a new version,
so please redownload and reinstall it.


> I tried to add it manually and it seems to work now :)
> ```
> $ sudo udev-hid-bpf add /sys/bus/hid/devices/0018:06CB:CE26.0005
> /usr/local/lib/firmware/hid/bpf/0011-Synaptics__DLL0945.bpf.o
> $ sudo tree /sys/fs/bpf
> /sys/fs/bpf
> └── hid
>     └── 0018_06CB_CE26_0005
>         └── 0011-Synaptics__DLL0945_bpf
>             └── synaptics_dll0945
> 
> 4 directories, 1 file
> ```
> But I have to do it manually every time.
> Not sure what's wrong, maybe the added udev rule:
> ```
> $ cat /etc/udev/rules.d/81-hid-bpf.rules
> ACTION!="add|remove|bind", GOTO="hid_bpf_end"
> SUBSYSTEM!="hid", GOTO="hid_bpf_end"
> 
> # We lookup the hwdb during bind to set the property, but we don't do
> anything else
> IMPORT{builtin}="hwdb --subsystem=hid --lookup-prefix=hid-bpf:"
> #ACTION=="add", ENV{.HID_BPF}=="1",
> RUN{program}+="@@BINDIR@@/udev-hid-bpf add $sys$devpath"
> #MARKER
> ACTION=="add", ENV{.HID_BPF}=="1",
> RUN{program}+="/usr/local/bin/udev-hid-bpf add $sys$devpath"
> #ACTION=="remove", ENV{.HID_BPF}=="1",
> RUN{program}+="@@BINDIR@@/udev-hid-bpf remove $sys$devpath"
> #MARKER
> ACTION=="remove", ENV{.HID_BPF}=="1",
> RUN{program}+="/usr/local/bin/udev-hid-bpf remove $sys$devpath"
> 
> LABEL="hid_bpf_end"
> ```

The udev rule is fine, the hwdb is not. If you look at
/etc/udev/hwdb.d/81-hid-bpf-testing.hwdb you'll see that it shows:

hid-bpf:hid:b0018g0001v000006CBp0000CE26
  HID_BPF_T_002=0011-Synaptics__DLL0945.bpf.o
  .HID_BPF=1

But if you run `cat /sys/bus/hid/devices/0018:06CB:CE26.*/modalias`
you'll see that you have something like:

hid:b0018g0004v000006CBp0000CE26

the 'g0004' is not correct and therefore the qutobinding doesn't work :(

> this is the udevadm info (after reboot, it is sometimes hidraw3
> sometimes hidraw4):
> ```
> $  udevadm info --query=all --name=/dev/hidraw4
> P: /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-1/i2c-DLL0945:00/0018:06CB:CE26.0005/hidraw/hidraw4
> M: hidraw4
> R: 4
> J: c242:4
> U: hidraw
> D: c 242:4
> N: hidraw4
> L: 0
> E: DEVPATH=/devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-1/i2c-DLL0945:00/0018:06CB:CE26.0005/hidraw/hidraw4
> E: DEVNAME=/dev/hidraw4
> E: MAJOR=242
> E: MINOR=4
> E: SUBSYSTEM=hidraw
> E: USEC_INITIALIZED=3980846
> E: ID_VENDOR_FROM_DATABASE=Dell Inc
> E: ID_PATH=pci-0000:00:15.1-platform-i2c_designware.1
> E: ID_PATH_TAG=pci-0000_00_15_1-platform-i2c_designware_1
> E: ID_FOR_SEAT=hidraw-pci-0000_00_15_1-platform-i2c_designware_1
> E: TAGS=:seat:
> E: CURRENT_TAGS=:seat:
> ```
> 
> Thank you for the quick fix, it seems to work great so far!

\o/.

Now I need to make the kernel patch. Ideally I'd like you to test it,
but worse case I can just replay the recording as it seems to be enough.

Cheers,
Benjamin

