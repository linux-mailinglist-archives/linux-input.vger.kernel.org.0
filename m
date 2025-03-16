Return-Path: <linux-input+bounces-10864-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC46A633D0
	for <lists+linux-input@lfdr.de>; Sun, 16 Mar 2025 05:20:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A7863170D70
	for <lists+linux-input@lfdr.de>; Sun, 16 Mar 2025 04:20:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A543A12EBE7;
	Sun, 16 Mar 2025 04:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="HHSWp+aA"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch [79.135.106.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34F9322A
	for <linux-input@vger.kernel.org>; Sun, 16 Mar 2025 04:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742098844; cv=none; b=YVEBJ/6EBq//n/g/TRwOV/iAIGHAoUOSQh3pb8ES9oYm909jusCmkLW8fk4TK1AlqijBakbP3fj6b4V0wwu6fV++X5yFC3kU4pAT/pJQTd9iD13Yztd/iUfgnNYuQyOZLpPAkwxd1Zh4iJwCu9JStDuKF3TFZdVne6iSf82EqtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742098844; c=relaxed/simple;
	bh=76LcCISZoiU10fClL5qA7YwZd36UqCpbjjau7BlGO+k=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qbd2ZnQ1XkPHHPQohl2HSFG94ZZoepBU0n92nN4xnxAkVTQcYJSuhQg2Jcd76zZfbSFbcpIdz42F2ZVptoEMjISEl5FWwtBQ3Yu9ZwXaj+m03+1Cgwbe3B5iJj7Gb93mtDrTlDJaJQmaH2tGcSJspsC4W6KBmRqfsPo+gVSlfMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=HHSWp+aA; arc=none smtp.client-ip=79.135.106.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1742098839; x=1742358039;
	bh=vxWKNyTjKz9Zo+/oSESrfgugwQ/3Qi4ce/xUleXcD5k=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=HHSWp+aAkObyPf+WNlDq3aMvoHY3NIpAZvcN3qy3tZv2hJumSNx4mX1tMXlyUe7jA
	 Fl06Fs0CWJ3N/1DRJZ8mapIWBhtyr1ClWjuXcUi9wb22bsrUw9Co6qy88uIDw9y88G
	 p9mTcGfM3DjQ+9yrjlhUPj3Z16iztfIMr/E1n239Q14p4I7hJWaomjAdskbnYJ5hbV
	 74pZ8G6XO/tzbiC3v3w+Ly76nrxsZoXC/977X+aFgdolnFem7F8VH6wII0cmd72OaV
	 6Vu1olF1kQbgvKlgd+pY4yMBBtduyshd0s/k/wYy/ytk9p3K7cwVJxf2g/yi4ewqy5
	 hiCIWrk2BkRIA==
Date: Sun, 16 Mar 2025 04:20:35 +0000
To: Benjamin Tissoires <bentiss@kernel.org>
From: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-input@vger.kernel.org, dri-devel@lists.freedesktop.org, Jiri Kosina <jikos@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH RFC 3/3] rust: hid: demo the core abstractions for probe and remove
Message-ID: <87frjdhaii.fsf@protonmail.com>
In-Reply-To: <m2cm4c4m7teaca3tog774tl25ynngicg4eav4i7xiqyrxsqwju@leh5og5d6uba>
References: <20250313160220.6410-2-sergeantsagara@protonmail.com> <20250313160220.6410-6-sergeantsagara@protonmail.com> <m2cm4c4m7teaca3tog774tl25ynngicg4eav4i7xiqyrxsqwju@leh5og5d6uba>
Feedback-ID: 26003777:user:proton
X-Pm-Message-ID: e7fc38772a099e3f17b7e79d87181ac9b498a011
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, 13 Mar, 2025 18:05:36 +0100 "Benjamin Tissoires" <bentiss@kernel.or=
g> wrote:
> On Mar 13 2025, Rahul Rameshbabu wrote:
>> This is a very basic "hello, world!" implementation to illustrate that t=
he
>> probe and remove callbacks are working as expected. I chose an arbitrary
>> device I had on hand for populating in the HID device id table.
>
> Nice to see this live :)
>
> Though as I mentioned in the previous patch, I'd prefer having one full
> driver in a single patch and one separate patch with the skeleton in the
> docs.
>
> Do you have any meaningful processing that needs to be done in the
> report fixup or in the .raw_event or .event callbacks?
>
> It would be much more interesting to show how this works together on a
> minimalistic driver.

Agreed. Have a discussion about a device to potentially use for such a
reference driver in another thread[1].

>
> FWIW, the driver in itself, though incomplete, looks familiar, which is
> a good thing: we've got a probe and a remove. This is common with all
> the other HID drivers, so it's not a brand new thing.
>
> I wonder however how and if we could enforce the remove() to be
> automated by the binding or rust, to not have to deal with resource
> leaking. Because the removal part, especially on failure, is the hardest
> part.

One issue with the device I proposed in [1] is that it would not require
the implementation of remove() or automation through Rust since the
device is so "simple".

Rust has the Drop trait[2]. If my understanding is correct, contained
data that also implement the Drop trait cannot be enforced in terms of
the order they are dropped/provide any kind of dependency management
here. It's worth exploring. My concern is some very tricky ordering
requirements on removal. I extracted the below from
drivers/hid/hid-nvidia-shield.c.

  static void shield_remove(struct hid_device *hdev)
  {
  =09struct shield_device *dev =3D hid_get_drvdata(hdev);
  =09struct thunderstrike *ts;

  =09ts =3D container_of(dev, struct thunderstrike, base);

  =09hid_hw_close(hdev);
  =09thunderstrike_destroy(ts);
  =09del_timer_sync(&ts->psy_stats_timer);
  =09cancel_work_sync(&ts->hostcmd_req_work);
  =09hid_hw_stop(hdev);
  }

Here, we need to explicitly stop the timer before cancelling any work.

The problem here is Rust's Drop trait does not gaurantee ordering for
the teardown of members.

Lets pretend I have the following and its functional in Rust.

  // In hid_nvidia_shield.rs

  struct Thunderstrike {
      // Rest of my thunderstrike members from the C equivalent
      psyStatsTimer: TimerList, // TimerList implements Drop
      hostcmdReqWork: Work, // Work implements Drop
  }

  // hid.rs

  struct Device<T> {
      // Details omitted
      privateData: T,
  }

  impl<T> Drop for Device<T> {
      fn drop(&mut self) {
          // Implementation here
      }
  }

The problem here is when the Device instance is dropped, we cannot
guarantee the order of the Drop::drop calls for the psyStatsTimer or
hostcmdReqWork members as-is. There might be some clever trick to solve
this problem that I am not aware of.

[1] https://lore.kernel.org/rust-for-linux/Z9MxI0u2yCfSzTvD@cassiopeiae/T/#=
m87f121ec72ba159071b20dccb4071cd7d2398050
[2] https://doc.rust-lang.org/std/ops/trait.Drop.html

Thanks for the review,
Rahul Rameshbabu

>
> Cheers,
> Benjamin
>
>>
>>   [  +0.012968] monitor_control: Probing HID device vendor: 2389 product=
: 29204 using Rust!
>>   [  +0.000108] monitor_control: Removing HID device vendor: 2389 produc=
t: 29204 using Rust!
>>
>> Signed-off-by: Rahul Rameshbabu <sergeantsagara@protonmail.com>
>> ---
>>  drivers/hid/hid_monitor_control.rs | 9 +++++++--
>>  1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/hid/hid_monitor_control.rs b/drivers/hid/hid_monito=
r_control.rs
>> index 18afd69a56d5..aeb6e4058a6b 100644
>> --- a/drivers/hid/hid_monitor_control.rs
>> +++ b/drivers/hid/hid_monitor_control.rs
>> @@ -8,17 +8,22 @@
>>      Driver,
>>  };
>>
>> +const USB_VENDOR_ID_NVIDIA: u32 =3D 0x0955;
>> +const USB_DEVICE_ID_NVIDIA_THUNDERSTRIKE_CONTROLLER: u32 =3D 0x7214;
>> +
>>  struct HidMonitorControl;
>>
>>  #[vtable]
>>  impl Driver for HidMonitorControl {
>>      fn probe(dev: &mut hid::Device, id: &hid::DeviceId) -> Result<()> {
>>          /* TODO implement */
>> +        pr_info!("Probing HID device vendor: {} product: {} using Rust!=
\n", id.vendor(), id.product());
>>          Ok(())
>>      }
>>
>>      fn remove(dev: &mut hid::Device) {
>>          /* TODO implement */
>> +        pr_info!("Removing HID device vendor: {} product: {} using Rust=
!\n", dev.vendor(), dev.product());
>>      }
>>  }
>>
>> @@ -26,8 +31,8 @@ fn remove(dev: &mut hid::Device) {
>>      driver: HidMonitorControl,
>>      id_table: [
>>          kernel::usb_device! {
>> -            vendor: /* TODO fill in */,
>> -            product: /* TODO fill in */,
>> +            vendor: USB_VENDOR_ID_NVIDIA,
>> +            product: USB_DEVICE_ID_NVIDIA_THUNDERSTRIKE_CONTROLLER,
>>          },
>>      ],
>>      name: "monitor_control",
>> --
>> 2.47.2
>>
>>



