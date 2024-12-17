Return-Path: <linux-input+bounces-8619-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFA89F4359
	for <lists+linux-input@lfdr.de>; Tue, 17 Dec 2024 07:13:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 04FC9169FFD
	for <lists+linux-input@lfdr.de>; Tue, 17 Dec 2024 06:13:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED1E1156222;
	Tue, 17 Dec 2024 06:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XhFTsP1Z"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DBD5158535;
	Tue, 17 Dec 2024 06:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734415994; cv=none; b=hR0FMjcRrP/CZcCT4KFWo64SiuIpV46fB9pFX/tun8iHjP/4P+OAF9sg+MJLNfcx/6crF1ZaAfcTMbvZmVm5wTZPUuaKU762+d0C3P0hM/3W2DDItNo8/jdvoSW9Jt0qj0+HfnoYdgVrhBh0MTVBIP68L/1Ewh+8QaJApK9zReI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734415994; c=relaxed/simple;
	bh=QWB++1iXox6f4kLgeJ8AfmdVqzTERKeYjjN2dzpfw94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dwHnECH54i/Kt+ss/OIYMsV2a5Rapd3en8sD3asd/iReKX9AcWuebv6r1gK0vHm+xgIEx0F2tAJ/v6K8PLl+9AU9S4yvI3/JNO1Yw0bOnc4ogFNxsOgqafOYBLmUBkUDWerY/cwk6F3qxKF3EPnEJxfhGlI7g6mFcCU5KDR4kUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XhFTsP1Z; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-72764c995e5so2933348b3a.2;
        Mon, 16 Dec 2024 22:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734415991; x=1735020791; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=350P5oevQWtzA3aS6WhQRVwPboAYaUL6xbflXSjexdI=;
        b=XhFTsP1ZnQo+0SQ6Yc5C8IjiBTvwS0JJWsC6mOk1VLApm8iHphG+e5dvO5Uic2ygib
         BJdHQpNh30Lxun0vG3grphTBJOj0z/tpCpcQbFYJGWOWZaHeieugfOsRbBaf+iHsZqoo
         wkl698lmQkJVGNqgcFbWBik5StokGSqxnqM68ATvJoET/gaHEyDF5HdynDTGyzlJoRTU
         IyaCNXpBUV1lkZWf0h8nkeOb89D5++n0frinCboWa66eNjCKL45waXpuWoUaUxHaY03p
         ReZtNOe0vbxsPLbK/n1scxX8SZYq54kwd5haO/JY9u7ga4q85DtqpYoCYdVAWrBxn5Uv
         Y2pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734415991; x=1735020791;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=350P5oevQWtzA3aS6WhQRVwPboAYaUL6xbflXSjexdI=;
        b=bAEN+Qbm3mjxNNP+0satra5LTTrybHWwB0ixCD2my3iAmN8I49vr+W3ukmKi7dLBMG
         wu7j152Ehv68e/JvI9zoNP6L6BWdzqSuWR6SVzv11oGaNmz0XJvV1uOnASaZRHTQUyuH
         IXc7kh3VRAa4F7HwivNZnRSmpVzQUQsKh5o4D0KhYYO5leK4R0gpeJxPeeDlrNRg7exz
         MNs1dQh4Z8eiyMkgs2XspU8t4LNPkDKOnxtIvL5ZFWeGjqEkKe66HfszQOjVBFVJusBu
         H5uJkhfqNPjCfLDD6MoQsW9qaaT9fxr9VxeNEq6tx7n4TZ3FHnyjoGGD/UeoWR8ssnq8
         i4BQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTkYqjL/yfbgVPd+CCm/DjehEthAsLVzpIBMjne/lbsFy1lHZwaZf4NpgNU0mK/v+iplIPqSZRUJY=@vger.kernel.org, AJvYcCXhY76QBeHqyyALFpS2VuvA7bIDfdZqOtqgDE0ExqdBR6q7i+/IamVC2EgW7gz47TX7Em/9yDEPoxdfkj1G@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2jhoJJNMYkPRpeQ5zIVluZ9hhma7I3HH8NgfRzKRw0NB0GkVH
	k9+uDpJN0H0wqWc4E/0345bNd90BdkKZJaooKVaPnvTRWpLcGggr
X-Gm-Gg: ASbGnct4E9dbpwlSvCPgbFPvBVSXArk0aUG6d9M0hIkkSVhInqlsblnnLpAoLm/zS++
	iIFRxDAqyh5fNK4mIq/3C6EVIVT/VZ20UU/lIMpMYk0YSFq5bm78BAAFsOMtdBRe0Q7Inab3+qn
	6kfHGIy1oqp83hhQEzNMx3EQdIUts0lrxeH7jdcGnvD7OXFslGfRmcLZ/YPtFIdDLSq34XdsLji
	jQrKHQr5ZiMAoBzhcDL5tXFusIvAnHoH65nncUCNVjuEB4AZWO3QE+K
X-Google-Smtp-Source: AGHT+IEubmUR0m+ov4ewkichdfiZFpXGfuHDoe60v/WQqaJAsRit30+HCDwr2DqlBCrlsofPeqg5NQ==
X-Received: by 2002:a05:6a20:918a:b0:1e1:c8f5:19ee with SMTP id adf61e73a8af0-1e1dfd9689cmr24891991637.25.1734415991048;
        Mon, 16 Dec 2024 22:13:11 -0800 (PST)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72918af0decsm5801057b3a.85.2024.12.16.22.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 22:13:09 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id AE9DC41F367E; Tue, 17 Dec 2024 13:13:07 +0700 (WIB)
Date: Tue, 17 Dec 2024 13:13:07 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Even Xu <even.xu@intel.com>, jikos@kernel.org, bentiss@kernel.org,
	corbet@lwn.net, aaron.ma@canonical.com, rdunlap@infradead.org
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Sun Xinpeng <xinpeng.sun@intel.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: Re: [PATCH v3 01/22] HID: THC: Add documentation
Message-ID: <Z2EWcwQhaiep9yC0@archie.me>
References: <20241216014127.3722172-1-even.xu@intel.com>
 <20241216014127.3722172-2-even.xu@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Pg/7f6fISpVuXC5J"
Content-Disposition: inline
In-Reply-To: <20241216014127.3722172-2-even.xu@intel.com>


--Pg/7f6fISpVuXC5J
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2024 at 09:41:06AM +0800, Even Xu wrote:
> diff --git a/Documentation/hid/intel-thc-hid.rst b/Documentation/hid/inte=
l-thc-hid.rst
> new file mode 100644
> index 000000000000..e9452c11d8de
> --- /dev/null
> +++ b/Documentation/hid/intel-thc-hid.rst
> @@ -0,0 +1,568 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Intel Touch Host Controller (THC)
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Touch Host Controller is the name of the IP block in PCH that interface =
with Touch Devices (ex:
> +touchscreen, touchpad etc.). It is comprised of 3 key functional blocks:
> +
> +- A natively half-duplex Quad I/O capable SPI master
> +- Low latency I2C interface to support HIDI2C compliant devices
> +- A HW sequencer with RW DMA capability to system memory
> +
> +It has a single root space IOSF Primary interface that supports transact=
ions to/from touch devices.
> +Host driver configures and controls the touch devices over THC interface=
=2E THC provides high
> +bandwidth DMA services to the touch driver and transfers the HID report =
to host system main memory.
> +
> +Hardware sequencer within the THC is responsible for transferring (via D=
MA) data from touch devices
> +into system memory. A ring buffer is used to avoid data loss due to asyn=
chronous nature of data
> +consumption (by host) in relation to data production (by touch device vi=
a DMA).
> +
> +Unlike other common SPI/I2C controllers, THC handles the HID device data=
 interrupt and reset
> +signals directly.
> +
> +1. Overview
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +1.1 THC software/hardware stack
> +-------------------------------
> +
> +Below diagram illustrates the high-level architecture of THC software/ha=
rdware stack, which is fully
> +capable of supporting HIDSPI/HIDI2C protocol in Linux OS.
> +
> +::
> +
> +  ----------------------------------------------
> + |      +-----------------------------------+   |
> + |      |           Input Device            |   |
> + |      +-----------------------------------+   |
> + |      +-----------------------------------+   |
> + |      |       HID Multi-touch Driver      |   |
> + |      +-----------------------------------+   |
> + |      +-----------------------------------+   |
> + |      |             HID Core              |   |
> + |      +-----------------------------------+   |
> + |      +-----------------------------------+   |
> + |      |    THC QuickSPI/QuickI2C Driver   |   |
> + |      +-----------------------------------+   |
> + |      +-----------------------------------+   |
> + |      |      THC Hardware Driver          |   |
> + |      +-----------------------------------+   |
> + |      +----------------+ +----------------+   |
> + |  SW  | PCI Bus Driver | | ACPI Resource  |   |
> + |      +----------------+ +----------------+   |
> +  ----------------------------------------------
> +  ----------------------------------------------
> + |      +-----------------------------------+   |
> + |  HW  |              PCI Bus              |   |
> + |      +-----------------------------------+   |
> + |      +-----------------------------------+   |
> + |      |           THC Controller          |   |
> + |      +-----------------------------------+   |
> + |      +-----------------------------------+   |
> + |      |              Touch IC             |   |
> + |      +-----------------------------------+   |
> +  ----------------------------------------------
> +
> +Touch IC (TIC), also as known as the Touch devices (touchscreen or touch=
pad). The discrete analog
> +components that sense and transfer either discrete touch data or heatmap=
 data in the form of HID
> +reports over the SPI/I2C bus to the THC Controller on the host.
> +
> +THC Host Controller, which is a PCI device HBA (host bus adapter), integ=
rated into the PCH, that
> +serves as a bridge between the Touch ICs and the host.
> +
> +THC Hardware Driver, provides THC hardware operation APIs for above Quic=
kSPI/QuickI2C driver, it
> +accesses THC MMIO registers to configure and control THC hardware.
> +
> +THC QuickSPI/QuickI2C driver, also as known as HIDSPI/HIDI2C driver, is =
registered as a HID
> +low-level driver that manages the THC Controller and implements HIDSPI/H=
IDI2C protocol.
> +
> +
> +1.2 THC hardware diagram
> +------------------------
> +Below diagram shows THC hardware components::
> +
> +                      ---------------------------------
> +                     |          THC Controller         |
> +                     |  +---------------------------+  |
> +                     |  |     PCI Config Space      |  |
> +                     |  +---------------------------+  |
> +                     |  +---------------------------+  |
> +                     |  +       MMIO Registers      |  |
> +                     |  +---------------------------+  |
> + +---------------+   |  +------------+ +------------+  |
> + | System Memory +---+--+      DMA   | |   PIO      |  |
> + +---------------+   |  +------------+ +------------+  |
> +                     |  +---------------------------+  |
> +                     |  |       HW Sequencer        |  |
> +                     |  +---------------------------+  |
> +                     |  +------------+ +------------+  |
> +                     |  |  SPI/I2C   | |    GPIO    |  |
> +                     |  | Controller | | Controller |  |
> +                     |  +------------+ +------------+  |
> +                      ---------------------------------
> +
> +As THC is exposed as a PCI devices, so it has standard PCI config space =
registers for PCI
> +enumeration and configuration.
> +
> +MMIO Registers, which provide registers access for driver to configure a=
nd control THC hardware,
> +the registers include several categories: Interrupt status and control, =
DMA configure,
> +PIO (Programmed I/O, defined in section 3.2) status and control, SPI bus=
 configure, I2C subIP
> +status and control, reset status and control...
> +
> +THC provides two ways for driver to communicate with external Touch ICs:=
 PIO and DMA.
> +PIO can let driver manually write/read data to/from Touch ICs, instead, =
THC DMA can
> +automatically write/read data without driver involved.
> +
> +HW Sequencer includes THC major logic, it gets instruction from MMIO reg=
isters to control
> +SPI bus and I2C bus to finish a bus data transaction, it also can automa=
tically handle
> +Touch ICs interrupt and start DMA receive/send data from/to Touch ICs ac=
cording to interrupt
> +type. That means THC HW Sequencer understands HIDSPI/HIDI2C transfer pro=
tocol, and handle
> +the communication without driver involved, what driver needs to do is ju=
st configure the THC
> +properly, and prepare the formatted data packet or handle received data =
packet.
> +
> +As THC supports HIDSPI/HIDI2C protocols, it has SPI controller and I2C s=
ubIP in it to expose
> +SPI bus and I2C bus. THC also integrates a GPIO controller to provide in=
terrupt line support
> +and reset line support.
> +
> +2. THC Hardware Interface
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> +
> +2.1 Host Interface
> +------------------
> +
> +THC is exposed as "PCI Digitizer device" to the host. The PCI product an=
d device IDs are
> +changed from different generations of processors. So the source code whi=
ch enumerates drivers
> +needs to update from generation to generation.
> +
> +
> +2.2 Device Interface
> +--------------------
> +
> +THC supports two types of bus for Touch IC connection: Enhanced SPI bus =
and I2C bus.
> +
> +2.2.1 SPI Port
> +~~~~~~~~~~~~~~
> +
> +When PORT_TYPE =3D 00b in MMIO registers, THC uses SPI interfaces to com=
municate with external
> +Touch IC. THC enhanced SPI Bus supports different SPI modes: standard Si=
ngle IO mode,
> +Dual IO mode and Quad IO mode.
> +
> +In Single IO mode, THC drives MOSI line to send data to Touch ICs, and r=
eceives data from Touch
> +ICs data from MISO line. In Dual IO mode, THC drivers MOSI and MISO both=
 for data sending, and
> +also receives the data on both line. In Quad IO mode, there are other tw=
o lines (IO2 and IO3)
> +are added, THC drives MOSI (IO0), MISO (IO1), IO2 and IO3 at the same ti=
me for data sending, and
> +also receives the data on those 4 lines. Driver needs to configure THC i=
n different mode by
> +setting different opcode.
> +
> +Beside IO mode, driver also needs to configure SPI bus speed. THC suppor=
ts up to 42MHz SPI clock
> +on Intel Lunar Lake platform.
> +
> +For THC sending data to Touch IC, the data flow on SPI bus::
> +
> + | --------------------THC sends---------------------------------|
> + <8Bits OPCode><24Bits Slave Address><Data><Data><Data>...........
> +
> +For THC receiving data from Touch IC, the data flow on SPI bus::
> +
> + | ---------THC Sends---------------||-----Touch IC sends--------|
> + <8Bits OPCode><24Bits Slave Address><Data><Data><Data>...........
> +
> +2.2.2 I2C Port
> +~~~~~~~~~~~~~~
> +
> +THC also integrates I2C controller in it, it's called I2C SubSystem. Whe=
n PORT_TYPE =3D 01, THC
> +is configured to I2C mode. Comparing to SPI mode which can be configured=
 through MMIO registers
> +directly, THC needs to use PIO read (by setting SubIP read opcode) to I2=
C subIP APB registers'
> +value and use PIO write (by setting SubIP write opcode) to do a write op=
eration.
> +
> +2.2.3 GPIO interface
> +~~~~~~~~~~~~~~~~~~~~
> +
> +THC also includes two GPIO pins, one for interrupt and the other for dev=
ice reset control.
> +
> +Interrupt line can be configured to either level triggerred or edge trig=
gerred by setting MMIO
> +Control register.
> +
> +Reset line is controlled by BIOS (or EFI) through ACPI _RST method, driv=
er needs to call this
> +device ACPI _RST method to reset touch IC during initialization.
> +
> +3. High level concept
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +3.1 Opcode
> +----------
> +
> +Opcode (operation code) is used to tell THC or Touch IC what the operati=
on will be, such as PIO
> +read or PIO write.
> +
> +When THC is configured to SPI mode, opcodes are used for determining the=
 read/write IO mode.
> +There are some OPCode examples for SPI IO mode:
> +
> +=3D=3D=3D=3D=3D=3D=3D   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +opcode    Corresponding SPI command
> +=3D=3D=3D=3D=3D=3D=3D   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +0x0B      Read Single I/O
> +0x02      Write Single I/O
> +0xBB      Read Dual I/O
> +0xB2      Write Dual I/O
> +0xEB      Read Quad I/O
> +0xE2      Write Quad I/O
> +=3D=3D=3D=3D=3D=3D=3D   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +In general, different touch IC has different OPCode definition. Accordin=
g to HIDSPI
> +protocol whitepaper, those OPCodes are defined in device ACPI table, and=
 driver needs to
> +query those information through OS ACPI APIs during driver initializatio=
n, then configures
> +THC MMIO OPCode registers with correct setting.
> +
> +When THC is working in I2C mode, opcodes are used to tell THC what's the=
 next PIO type:
> +I2C SubIP APB register read, I2C SubIP APB register write, I2C touch IC =
device read,
> +I2C touch IC device write, I2C touch IC device write followed by read.
> +
> +Here are the THC pre-defined opcodes for I2C mode:
> +
> +=3D=3D=3D=3D=3D=3D=3D   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +opcode    Corresponding I2C command                             Address
> +=3D=3D=3D=3D=3D=3D=3D   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +0x12      Read I2C SubIP APB internal registers                 0h - FFh
> +0x13      Write I2C SubIP APB internal registers                0h - FFh
> +0x14      Read external Touch IC through I2C bus                N/A
> +0x18      Write external Touch IC through I2C bus               N/A
> +0x1C      Write then read external Touch IC through I2C bus     N/A
> +=3D=3D=3D=3D=3D=3D=3D   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +3.2 PIO
> +-------
> +
> +THC provides a programmed I/O (PIO) access interface for the driver to a=
ccess the touch IC's
> +configuration registers, or access I2C subIP's configuration registers. =
To use PIO to perform
> +I/O operations, driver should pre-program PIO control registers and PIO =
data registers and kick
> +off the sequencing cycle. THC uses different PIO opcodes to distinguish =
different PIO
> +operations (PIO read/write/write followed by read).
> +
> +If there is a Sequencing Cycle In Progress and an attempt is made to pro=
gram any of the control,
> +address, or data register the cycle is blocked and a sequence error will=
 be encountered.
> +
> +A status bit indicates when the cycle has completed allowing the driver =
to know when read results
> +can be checked and/or when to initiate a new command. If enabled, the cy=
cle done assertion can
> +interrupt driver with an interrupt.
> +
> +Because THC only has 16 FIFO registers for PIO, so all the data transfer=
 through PIO shouldn't
> +exceed 64 bytes.
> +
> +As DMA needs max packet size for transferring configuration, and the max=
 packet size information
> +always in HID device descriptor which needs THC driver to read it out fr=
om HID Device (Touch IC).
> +So PIO typical use case is, before DMA initialization, write RESET comma=
nd (PIO write), read
> +RESET response (PIO read or PIO write followed by read), write Power ON =
command (PIO write), read
> +device descriptor (PIO read).
> +
> +For how to issue a PIO operation, here is the steps which driver needs f=
ollow:
> +
> +- Program read/write data size in THC_SS_BC.
> +- Program I/O target address in THC_SW_SEQ_DATA0_ADDR.
> +- If write, program the write data in THC_SW_SEQ_DATA0..THC_SW_SEQ_DATAn.
> +- Program the PIO opcode in THC_SS_CMD.
> +- Set TSSGO =3D 1 to start the PIO write sequence.
> +- If THC_SS_CD_IE =3D 1, SW will receives a MSI when the PIO is complete=
d.
> +- If read, read out the data in THC_SW_SEQ_DATA0..THC_SW_SEQ_DATAn.
> +
> +3.3 DMA
> +-------
> +
> +THC has 4 DMA channels: Read DMA1, Read DMA2, Write DMA and Software DMA.
> +
> +3.3.1 Read DMA Channel
> +~~~~~~~~~~~~~~~~~~~~~~
> +
> +THC has two Read DMA engines: 1st RxDMA (RxDMA1) and 2nd RxDMA (RxDMA2).=
 RxDMA1 is reserved for
> +raw data mode. RxDMA2 is used for HID data mode and it is the RxDMA engi=
ne currently driver uses
> +for HID input report data retrieval.
> +
> +RxDMA's typical use case is auto receiving the data from Touch IC. Once =
RxDMA is enabled by
> +software, THC will start auto-handling receiving logic.
> +
> +For SPI mode, THC RxDMA sequence is: when Touch IC triggers a interrupt =
to THC, THC reads out
> +report header to identify what's the report type, and what's the report =
length, according to
> +above information, THC reads out report body to internal FIFO and start =
RxDMA coping the data
> +to system memory. After that, THC update interrupt cause register with r=
eport type, and update
> +RxDMA PRD table read pointer, then trigger a MSI interrupt to notify dri=
ver RxDMA finishing
> +data receiving.
> +
> +For I2C mode, THC RxDMA's behavior is little difference, because of HIDI=
2C protocol difference with
                                     "a little bit different, ..."
> +HIDSPI protocol, RxDMA only be used to receive input report. The sequenc=
e is, when Touch IC
> +triggers a interrupt to THC, THC first reads out 2 bytes from input repo=
rt address to determine the
> +packet length, then use this packet length to start a DMA reading from i=
nput report address for
> +input report data. After that, THC update RxDMA PRD table read pointer, =
then trigger a MSI interrupt
> +to notify driver input report data is ready in system memory.
> +
> +All above sequence is hardware automatically handled, all driver needs t=
o do is configure RxDMA and
> +waiting for interrupt ready then read out the data from system memory.
> +
> +3.3.2 Software DMA channel
> +~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +THC supports a software triggerred RxDMA mode to read the touch data fro=
m touch IC. This SW RxDMA
> +is the 3rd THC RxDMA engine with the similar functionalities as the exis=
ting two RxDMAs, the only
> +difference is this SW RxDMA is triggerred by software, and RxDMA2 is tri=
ggerred by external Touch IC
> +interrupt. It gives a flexiblity to software driver to use RxDMA read To=
uch IC data in any time.
> +
> +Before software starts a SW RxDMA, it shall stop the 1st and 2nd RxDMA, =
clear PRD read/write pointer
> +and quiesce the device interrupt (THC_DEVINT_QUIESCE_HW_STS =3D 1), othe=
r operations are the same with
> +RxDMA.
> +
> +3.3.3 Write DMA Channel
> +~~~~~~~~~~~~~~~~~~~~~~~
> +
> +THC has one write DMA engine, which can be used for sending data to Touc=
h IC automatically.
> +According to HIDSPI and HIDI2C protocol, every time only one command can=
 be sent to touch IC, and
> +before last command is completely handled, next command cannot be sent, =
THC write DMA engine only
> +supports single PRD table.
> +
> +What driver needs to do is, preparing PRD table and DMA buffer, then cop=
y data to DMA buffer and
> +update PRD table with buffer address and buffer length, then start write=
 DMA. THC will
> +automatically send the data to touch IC, and trigger a DMA completion in=
terrupt once transferring
> +is done.
> +
> +3.4 PRD
> +-------
> +
> +Physical Region Descriptor (PRD) provides the memory mapping description=
 for THC DMAs.
> +
> +3.4.1 PRD table and entry
> +~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +In order to improve physical DMA memory usage, modern drivers trend to a=
llocate a virtually
> +contiguous, but physically fragmented buffer of memory for each data buf=
fer. Linux OS also
> +provide SGL (scatter gather list) APIs to support this usage.
> +
> +THC uses PRD table (physical region descriptor) to support the correspon=
ding OS kernel
> +SGL that describes the virtual to physical buffer mapping.
> +
> +::
> +
> +  ------------------------      --------------       --------------
> + | PRD table base address +----+ PRD table #1 +-----+ PRD Entry #1 |
> +  ------------------------      --------------       --------------
> +                                                     --------------
> +                                                    | PRD Entry #2 |
> +                                                     --------------
> +                                                     --------------
> +                                                    | PRD Entry #n |
> +                                                     --------------
> +
> +The read DMA engine supports multiple PRD tables held within a circular =
buffer that allow the THC
> +to support multiple data buffers from the Touch IC. This allows host SW =
to arm the Read DMA engine
> +with multiple buffers, allowing the Touch IC to send multiple data frame=
s to the THC without SW
> +interaction. This capability is required when the CPU processes touch fr=
ames slower than the
> +Touch IC can send them.
> +
> +To simplify the design, SW assumes worst-case memory fragmentation. Ther=
efore,each PRD table shall
> +contain the same number of PRD entries, allowing for a global register (=
per Touch IC) to hold the
> +number of PRD-entries per PRD table.
> +
> +SW allocates up to 128 PRD tables per Read DMA engine as specified in th=
e THC_M_PRT_RPRD_CNTRL.PCD
> +register field. The number of PRD tables should equal the number of data=
 buffers.
> +
> +Max OS memory fragmentation will be at a 4KB boundary, thus to address 1=
MB of virtually contiguous
> +memory 256 PRD entries are required for a single PRD Table. SW writes th=
e number of PRD entries
> +for each PRD table in the THC_M_PRT_RPRD_CNTRL.PTEC register field. The =
PRD entry's length must be
> +multiple of 4KB except for the last entry in a PRD table.
> +
> +SW allocates all the data buffers and PRD tables only once at host initi=
alization.
> +
> +3.4.2 PRD Write pointer and read pointer
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +As PRD tables are organized as a Circular Buffer (CB), a read pointer an=
d a write pointer for a CB
> +are needed.
> +
> +DMA HW consumes the PRD tables in the CB, one PRD entry at a time until =
the EOP bit is found set
> +in a PRD entry. At this point HW increments the PRD read pointer. Thus, =
the read pointer points
> +to the PRD which the DMA engine is currently processing. This pointer ro=
lls over once the circular
> +buffer's depth has been traversed with bit[7] the Rollover bit. E.g. if =
the DMA CB depth is equal
> +to 4 entries (0011b), then the read pointers will follow this pattern (H=
W is required to honor
> +this behavior): 00h 01h 02h 03h 80h 81h 82h 83h 00h 01h ...
> +
> +The write pointer is updated by SW. The write pointer points to location=
 in the DMA CB, where the
> +next PRD table is going to be stored. SW needs to ensure that this point=
er rolls over once the
> +circular buffer's depth has been traversed with Bit[7] as the rollover b=
it. E.g. if the DMA CB
> +depth is equal to 5 entries (0100b), then the write pointers will follow=
 this pattern (SW is
> +required to honor this behavior): 00h 01h 02h 03h 04h 80h 81h 82h 83h 84=
h 00h 01h ..
> +
> +3.4.3 PRD descriptor structure
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +Intel THC uses PRD entry descriptor for every PRD entry. Every PRD entry=
 descriptor occupies
> +128 bits memories:
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D   =3D=3D=3D=3D=
=3D=3D=3D=3D   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> +struct field          bit(s)     description
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D   =3D=3D=3D=3D=
=3D=3D=3D=3D   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> +dest_addr             53..0      destination memory address, as every en=
try
> +                                 is 4KB, ignore lowest 10 bits of addres=
s.
> +reserved1             54..62     reserved
> +int_on_completion     63         completion interrupt enable bit, if thi=
s bit
> +                                 set it means THC will trigger a complet=
ion
> +                                 interrupt. This bit is set by SW driver.
> +len                   87..64     how many bytes of data in this entry.
> +end_of_prd            88         end of PRD table bit, if this bit is se=
t,
> +                                 it means this entry is last entry in th=
is PRD
> +                                 table. This bit is set by SW driver.
> +hw_status             90..89     HW status bits
> +reserved2             127..91    reserved
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D   =3D=3D=3D=3D=
=3D=3D=3D=3D   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> +
> +And one PRD table can include up to 256 PRD entries, as every entries is=
 4K bytes, so every
> +PRD table can describe 1M bytes memory.
> +
> +.. code-block:: c
> +
> +   struct thc_prd_table {
> +        struct thc_prd_entry entries[PRD_ENTRIES_NUM];
> +   };
> +
> +In general, every PRD table means one HID touch data packet. Every DMA e=
ngine can support
> +up to 128 PRD tables (except write DMA, write DMA only has one PRD table=
). SW driver is responsible
> +to get max packet length from touch IC, and use this max packet length t=
o create PRD entries for
> +each PRD table.
> +
> +4. HIDSPI support (QuickSPI)
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> +
> +Intel THC is total compatible with HIDSPI protocol, THC HW sequenser can=
 accelerate HIDSPI
> +protocol transferring.
> +
> +4.1 Reset Flow
> +--------------
> +
> +- Call ACPI _RST method to reset Touch IC device.
> +- Read the reset response from TIC through PIO read.
> +- Issue a command to retrieve device descriptor from Touch IC through PI=
O write.
> +- Read the device descriptor from Touch IC through PIO read.
> +- If the device descriptor is valid, allocate DMA buffers and configure =
all DMA channels.
> +- Issue a command to retrieve report descriptor from Touch IC through DM=
A.
> +
> +4.2 Input Report Data Flow
> +--------------------------
> +
> +Basic Flow:
> +
> +- Touch IC interrupts the THC Controller using an in-band THC interrupt.
> +- THC Sequencer reads the input report header by transmitting read appro=
val as a signal
> +  to the Touch IC to prepare for host to read from the device.
> +- THC Sequencer executes a Input Report Body Read operation correspondin=
g to the value
> +  reflected in =E2=80=9CInput Report Length=E2=80=9D field of the Input =
Report Header.
> +- THC DMA engine begins fetching data from the THC Sequencer and writes =
to host memory
> +  at PRD entry 0 for the current CB PRD table entry. This process contin=
ues until the
> +  THC Sequencer signals all data has been read or the THC DMA Read Engin=
e reaches the
> +  end of it's last PRD entry (or both).
> +- The THC Sequencer checks for the =E2=80=9CLast Fragment Flag=E2=80=9D =
bit in the Input Report Header.
> +  If it is clear, the THC Sequencer enters an idle state.
> +- If the =E2=80=9CLast Fragment Flag=E2=80=9D bit is enabled the THC Seq=
uencer enters End-of-Frame Processing.
> +
> +THC Sequencer End of Frame Processing:
> +
> +- THC DMA engine increments the read pointer of the Read PRD CB, sets EO=
F interrupt status
> +  in RxDMA2 register (THC_M_PRT_READ_DMA_INT_STS_2).
> +- If THC EOF interrupt is enabled by the driver in the control register =
(THC_M_PRT_READ_DMA_CNTRL_2),
> +  generates interrupt to software.
> +
> +Sequence of steps to read data from RX DMA buffer:
> +
> +- THC QuickSPI driver checks CB write Ptr and CB read Ptr to identify if=
 any data frame in DMA
> +  circular buffers.
> +- THC QuickSPI driver gets first unprocessed PRD table.
> +- THC QuickSPI driver scans all PRD entries in this PRD table to calcula=
te the total frame size.
> +- THC QuickSPI driver copies all frame data out.
> +- THC QuickSPI driver checks the data type according to input report bod=
y, and calls related
> +  callbacks to process the data.
> +- THC QuickSPI driver updates write Ptr.
> +
> +4.3 Output Report Data Flow
> +---------------------------
> +
> +Generic Output Report Flow:
> +
> +- HID core calls raw_request callback with a request to THC QuickSPI dri=
ver.
> +- THC QuickSPI Driver converts request provided data into the output rep=
ort packet and copies it
> +  to THC's write DMA buffer.
> +- Start TxDMA to complete the write operation.
> +
> +5. HIDI2C support (QuickI2C)
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> +
> +5.1 Reset Flow
> +--------------
> +
> +- Read device descriptor from Touch IC device through PIO write followed=
 by read.
> +- If the device descriptor is valid, allocate DMA buffers and configure =
all DMA channels.
> +- Use PIO or TxDMA to write a SET_POWER request to TIC's command registe=
r, and check if the
> +  write operation is successfully completed.
> +- Use PIO or TxDMA to write a RESET request to TIC's command register. I=
f the write operation
> +  is successfully completed, wait for reset response from TIC.
> +- Use SWDMA to read report descriptor through TIC's report descriptor re=
gister.
> +
> +5.2 Input Report Data Flow
> +--------------------------
> +
> +Basic Flow:
> +
> +- Touch IC asserts the interrupt indicating that it has an interrupt to =
send to HOST.
> +  THC Sequencer issues a READ request over the I2C bus. The HIDI2C devic=
e returns the
> +  first 2 bytes from the HIDI2C device which contains the length of the =
received data.
> +- THC Sequencer continues the Read operation as per the size of data ind=
icated in the
> +  length field.
> +- THC DMA engine begins fetching data from the THC Sequencer and writes =
to host memory
> +  at PRD entry 0 for the current CB PRD table entry. THC writes 2Bytes f=
or length field
> +  plus the remaining data to RxDMA buffer. This process continues until =
the THC Sequencer
> +  signals all data has been read or the THC DMA Read Engine reaches the =
end of it's last
> +  PRD entry (or both).
> +- THC Sequencer enters End-of-Input Report Processing.
> +- If the device has no more input reports to send to the host, it de-ass=
erts the interrupt
> +  line. For any additional input reports, device keeps the interrupt lin=
e asserted and
> +  steps 1 through 4 in the flow are repeated.
> +
> +THC Sequencer End of Input Report Processing:
> +
> +- THC DMA engine increments the read pointer of the Read PRD CB, sets EO=
F interrupt status
> +  in RxDMA 2 register (THC_M_PRT_READ_DMA_INT_STS_2).
> +- If THC EOF interrupt is enabled by the driver in the control register
> +  (THC_M_PRT_READ_DMA_CNTRL_2), generates interrupt to software.
> +
> +Sequence of steps to read data from RX DMA buffer:
> +
> +- THC QuickI2C driver checks CB write Ptr and CB read Ptr to identify if=
 any data frame in DMA
> +  circular buffers.
> +- THC QuickI2C driver gets first unprocessed PRD table.
> +- THC QuickI2C driver scans all PRD entries in this PRD table to calcula=
te the total frame size.
> +- THC QuickI2C driver copies all frame data out.
> +- THC QuickI2C driver call hid_input_report to send the input report con=
tent to HID core, which
> +  includes Report ID + Report Data Content (remove the length field from=
 the original report
> +  data).
> +- THC QuickI2C driver updates write Ptr.
> +
> +5.3 Output Report Data Flow
> +---------------------------
> +
> +Generic Output Report Flow:
> +
> +- HID core call THC QuickI2C raw_request callback.
> +- THC QuickI2C uses PIO or TXDMA to write a SET_REPORT request to TIC's =
command register. Report
> +  type in SET_REPORT should be set to Output.
> +- THC QuickI2C programs TxDMA buffer with TX Data to be written to TIC's=
 data register. The first
> +  2 bytes should indicate the length of the report followed by the repor=
t contents including
> +  Report ID.
> +
> +6. THC Debugging
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +To debug THC, event tracing mechanism is used. To enable debug logs::
> +
> +  echo 1 > /sys/kernel/debug/tracing/events/intel_thc/enable
> +  cat /sys/kernel/debug/tracing/trace
> +
> +7. Reference
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +- HIDSPI: https://download.microsoft.com/download/c/a/0/ca07aef3-3e10-40=
22-b1e9-c98cea99465d/HidSpiProtocolSpec.pdf
> +- HIDI2C: https://download.microsoft.com/download/7/d/d/7dd44bb7-2a7a-45=
05-ac1c-7227d3d96d5b/hid-over-i2c-protocol-spec-v1-0.docx

The rest looks good.

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--Pg/7f6fISpVuXC5J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZ2EWbwAKCRD2uYlJVVFO
ozsZAP4zN3ZysEcmQSdMSFp4019WH0eNUeOYQtlMc4ibe60O8AEAjBFahHn4uUW8
GPzqcN4rv3jiIIqoBFQx+tJPto+J2wI=
=5FaL
-----END PGP SIGNATURE-----

--Pg/7f6fISpVuXC5J--

