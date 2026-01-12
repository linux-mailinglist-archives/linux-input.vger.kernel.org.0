Return-Path: <linux-input+bounces-16974-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C52D12AF5
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 14:08:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 00D08300A9A4
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 13:08:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A89C2358D01;
	Mon, 12 Jan 2026 13:08:57 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22096358D00;
	Mon, 12 Jan 2026 13:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768223337; cv=none; b=UEzAXl+ecvkMJuZ+TJcvGKtWT0U+QdPBcmwRTD27Fd/5EIQT0aISbrc7j5XtrdNuY6tCS8AvtPyVtk8HtmD79/ceJT0027at9+z5MeBnaKS4vOyY9QtihoyIcHkRlM8cwhe825jbhrdDh/SD/yF8/n3p0dDAt0q2BeRwV9dubJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768223337; c=relaxed/simple;
	bh=uKN+KSSkTEVecTqo2cwDDM/6rrzPAMP58LmH6hOA7yA=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nsAjnuh6UnmyTiceXxUMf3cF1c3Wp0TuYCSslZCMswOdCCV/+AaHuuPTAKVLNI4Xh66VuPey+3kWamSWfswR9nEpKazyfGvGLakVSv8t4Q+V+uFIY9IBq1PDEdOkWYHrMHgW37XF9XlqE2mLfkJqxc/8ux5BPb4GEtkpxXF7hyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net; spf=pass smtp.mailfrom=hadess.net; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hadess.net
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5A0471FD47;
	Mon, 12 Jan 2026 13:08:45 +0000 (UTC)
Message-ID: <cc997c35b10ca1073397cb0c3b66ab2c0a2bdcb0.camel@hadess.net>
Subject: Re: [PATCH v2 3/4] Documentation: ABI: Document SteelSeries headset
 sysfs attributes
From: Bastien Nocera <hadess@hadess.net>
To: Sriman Achanta <srimanachanta@gmail.com>, Jiri Kosina
 <jikos@kernel.org>,  Benjamin Tissoires	 <bentiss@kernel.org>,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 12 Jan 2026 14:08:44 +0100
In-Reply-To: <20260112041941.40531-4-srimanachanta@gmail.com>
References: <20260112041941.40531-1-srimanachanta@gmail.com>
	 <20260112041941.40531-4-srimanachanta@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-GND-Sasl: hadess@hadess.net
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduudejheefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkuffhvfffjghftgfgfgggsehtqhertddtreejnecuhfhrohhmpeeurghsthhivghnucfpohgtvghrrgcuoehhrgguvghssheshhgruggvshhsrdhnvghtqeenucggtffrrghtthgvrhhnpeeuveeivdetkeekgfefffeftefhjeeikeetffdvteejheefieeltedtvdeuleduleenucfkphepvdgrtddumegvfeegmegvtgejfeemtghfvddtmegsrgegfeemrgeijeeimegtvdgufeemjegrheefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvfeegmegvtgejfeemtghfvddtmegsrgegfeemrgeijeeimegtvdgufeemjegrheefpdhhvghloheplgfkrfhvieemvdgrtddumegvfeegmegvtgejfeemtghfvddtmegsrgegfeemrgeijeeimegtvdgufeemjegrheefngdpmhgrihhlfhhrohhmpehhrgguvghssheshhgruggvshhsrdhnvghtpdhqihgupeehtedtgeejudfhffegjedpmhhouggvpehsmhhtphhouhhtpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepshhrihhmrghnrggthhgrnhhtrgesghhmrghilhdrtghomhdprhgtphhtthhopehjihhkohhssehkvghrnhgvlhdro
 hhrghdprhgtphhtthhopegsvghnthhishhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhinhhpuhhtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg

On Sun, 2026-01-11 at 23:19 -0500, Sriman Achanta wrote:
> Replace the SRW-S1 specific documentation with comprehensive
> documentation for the hid-steelseries driver covering both the legacy
> SRW-S1 wheel and the modern Arctis headset lineup.

Renaming the sysfs-driver-hid-srws1 should be done separately from
adding new contents.

This patch should also come after the feature gets added.

>=20
> New sysfs attributes documented:
> - sidetone_level: Control microphone monitoring volume

This should be an ALSA mixer, not a sysfs file.

> - inactive_time: Auto-sleep timeout configuration
> - chatmix_level: Game/Chat audio balance (read-only)

Ditto for an ALSA mixer.

> - mic_mute_led_brightness: Microphone mute LED brightness control

This probably needs to be a standard LED device.

> - mic_volume: Internal microphone gain control

Ditto for an ALSA mixer.

> - volume_limiter: EU hearing protection volume limiter

Ditto for an ALSA switch.

> - bluetooth_on_power: Bluetooth auto-enable on power-on
> - bluetooth_call_vol: Bluetooth call audio attenuation settings

Ditto for an ALSA mixer.

>=20
> The SRW-S1 LED documentation is preserved and moved into the new
> unified
> documentation file.
>=20
> Signed-off-by: Sriman Achanta <srimanachanta@gmail.com>
> ---
> =C2=A0.../ABI/testing/sysfs-driver-hid-srws1=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 21 ---
> =C2=A0.../ABI/testing/sysfs-driver-hid-steelseries=C2=A0 | 131
> ++++++++++++++++++
> =C2=A02 files changed, 131 insertions(+), 21 deletions(-)
> =C2=A0delete mode 100644 Documentation/ABI/testing/sysfs-driver-hid-srws1
> =C2=A0create mode 100644 Documentation/ABI/testing/sysfs-driver-hid-
> steelseries
>=20
> diff --git a/Documentation/ABI/testing/sysfs-driver-hid-srws1
> b/Documentation/ABI/testing/sysfs-driver-hid-srws1
> deleted file mode 100644
> index d0eba70c7d40..000000000000
> --- a/Documentation/ABI/testing/sysfs-driver-hid-srws1
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -What:		/sys/class/leds/SRWS1::<serial>::RPM1
> -What:		/sys/class/leds/SRWS1::<serial>::RPM2
> -What:		/sys/class/leds/SRWS1::<serial>::RPM3
> -What:		/sys/class/leds/SRWS1::<serial>::RPM4
> -What:		/sys/class/leds/SRWS1::<serial>::RPM5
> -What:		/sys/class/leds/SRWS1::<serial>::RPM6
> -What:		/sys/class/leds/SRWS1::<serial>::RPM7
> -What:		/sys/class/leds/SRWS1::<serial>::RPM8
> -What:		/sys/class/leds/SRWS1::<serial>::RPM9
> -What:		/sys/class/leds/SRWS1::<serial>::RPM10
> -What:		/sys/class/leds/SRWS1::<serial>::RPM11
> -What:		/sys/class/leds/SRWS1::<serial>::RPM12
> -What:		/sys/class/leds/SRWS1::<serial>::RPM13
> -What:		/sys/class/leds/SRWS1::<serial>::RPM14
> -What:		/sys/class/leds/SRWS1::<serial>::RPM15
> -What:		/sys/class/leds/SRWS1::<serial>::RPMALL
> -Date:		Jan 2013
> -KernelVersion:	3.9
> -Contact:	Simon Wood <simon@mungewell.org>
> -Description:	Provides a control for turning on/off the LEDs which
> form
> -		an RPM meter on the front of the controller
> diff --git a/Documentation/ABI/testing/sysfs-driver-hid-steelseries
> b/Documentation/ABI/testing/sysfs-driver-hid-steelseries
> new file mode 100644
> index 000000000000..751cf01ceda3
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-driver-hid-steelseries
> @@ -0,0 +1,131 @@
> +What:		/sys/class/leds/SRWS1::<serial>::RPM1
> +What:		/sys/class/leds/SRWS1::<serial>::RPM2
> +What:		/sys/class/leds/SRWS1::<serial>::RPM3
> +What:		/sys/class/leds/SRWS1::<serial>::RPM4
> +What:		/sys/class/leds/SRWS1::<serial>::RPM5
> +What:		/sys/class/leds/SRWS1::<serial>::RPM6
> +What:		/sys/class/leds/SRWS1::<serial>::RPM7
> +What:		/sys/class/leds/SRWS1::<serial>::RPM8
> +What:		/sys/class/leds/SRWS1::<serial>::RPM9
> +What:		/sys/class/leds/SRWS1::<serial>::RPM10
> +What:		/sys/class/leds/SRWS1::<serial>::RPM11
> +What:		/sys/class/leds/SRWS1::<serial>::RPM12
> +What:		/sys/class/leds/SRWS1::<serial>::RPM13
> +What:		/sys/class/leds/SRWS1::<serial>::RPM14
> +What:		/sys/class/leds/SRWS1::<serial>::RPM15
> +What:		/sys/class/leds/SRWS1::<serial>::RPMALL
> +Date:		Jan 2013
> +KernelVersion:	3.9
> +Contact:	Simon Wood <simon@mungewell.org>
> +Description:	Provides a control for turning on/off the LEDs which
> form
> +		an RPM meter on the front of the controller
> +
> +What:		/sys/class/hid/drivers/steelseries/<dev>/sidetone_le
> vel
> +Date:		January 2025
> +KernelVersion:	6.19
> +Contact:	Sriman Achanta <srimanachanta@gmail.com>
> +Description:
> +		Controls the sidetone (microphone monitoring) volume
> level.
> +		This determines how much of the microphone input is
> fed back into
> +		the headset speakers.
> +
> +		Range: 0-128 (mapped internally to device-specific
> values).
> +
> +		Access: Write
> +
> +What:		/sys/class/hid/drivers/steelseries/<dev>/inactive_ti
> me
> +Date:		January 2025
> +KernelVersion:	6.19
> +Contact:	Sriman Achanta <srimanachanta@gmail.com>
> +Description:
> +		Sets the time in minutes before the headset
> automatically enters
> +		standby/sleep mode when no audio is playing.
> +
> +		Range: 0-90 (minutes).
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Some devices (e.g., Arctis 1/7X) =
map this to
> specific presets.
> +
> +		Access: Write
> +
> +What:		/sys/class/hid/drivers/steelseries/<dev>/chatmix_lev
> el
> +Date:		January 2025
> +KernelVersion:	6.19
> +Contact:	Sriman Achanta <srimanachanta@gmail.com>
> +Description:
> +		Reports the current balance between Game and Chat
> audio channels
> +		(ChatMix). This value changes when the physical
> ChatMix dial
> +		on the headset is adjusted.
> +
> +		Range: 0-128
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0 =3D 100% Chat / 0% =
Game
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 64=C2=A0 =3D 50% Chat / 50% Game =
(Balanced)
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 128 =3D 0% Chat / 100% Game
> +
> +		Access: Read
> +
> +What:		/sys/class/hid/drivers/steelseries/<dev>/mic_mute_le
> d_brightness
> +Date:		January 2025
> +KernelVersion:	6.19
> +Contact:	Sriman Achanta <srimanachanta@gmail.com>
> +Description:
> +		Controls the brightness of the LED on the microphone
> boom that
> +		indicates when the microphone is muted.
> +
> +		Range: 0-3 (off, low, medium, high) for most
> devices.
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0-10 for newer Nova series device=
s.
> +
> +		Access: Write
> +
> +What:		/sys/class/hid/drivers/steelseries/<dev>/mic_volume
> +Date:		January 2025
> +KernelVersion:	6.19
> +Contact:	Sriman Achanta <srimanachanta@gmail.com>
> +Description:
> +		Controls the internal microphone gain/volume of the
> headset.
> +		This is distinct from the OS input volume.
> +
> +		Range: 0-128 (mapped internally to device-specific
> values).
> +
> +		Access: Write
> +
> +What:		/sys/class/hid/drivers/steelseries/<dev>/volume_limi
> ter
> +Date:		January 2025
> +KernelVersion:	6.19
> +Contact:	Sriman Achanta <srimanachanta@gmail.com>
> +Description:
> +		Enables or disables the EU volume limiter (hearing
> protection).
> +		When enabled, the maximum output volume is capped.
> +
> +		Values:
> +		0 =3D Disabled
> +		1 =3D Enabled
> +
> +		Access: Write
> +
> +What:		/sys/class/hid/drivers/steelseries/<dev>/bluetooth_o
> n_power
> +Date:		January 2025
> +KernelVersion:	6.19
> +Contact:	Sriman Achanta <srimanachanta@gmail.com>
> +Description:
> +		Configures whether the Bluetooth radio automatically
> turns on
> +		when the headset is powered on.
> +
> +		Values:
> +		0 =3D Bluetooth must be turned on manually
> +		1 =3D Bluetooth turns on automatically with headset
> +
> +		Access: Write
> +
> +What:		/sys/class/hid/drivers/steelseries/<dev>/bluetooth_c
> all_vol
> +Date:		January 2025
> +KernelVersion:	6.19
> +Contact:	Sriman Achanta <srimanachanta@gmail.com>
> +Description:
> +		Configures how the 2.4GHz Game/Chat audio is
> attenuated when
> +		a Bluetooth call is active.
> +
> +		Values:
> +		0 =3D No attenuation (mix both equally)
> +		1 =3D Attenuate Game audio by -12dB
> +		2 =3D Mute Game audio completely
> +
> +		Access: Write

