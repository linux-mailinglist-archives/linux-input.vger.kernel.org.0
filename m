Return-Path: <linux-input+bounces-17197-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 929A5D3BBB8
	for <lists+linux-input@lfdr.de>; Tue, 20 Jan 2026 00:21:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E496F3008984
	for <lists+linux-input@lfdr.de>; Mon, 19 Jan 2026 23:21:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E2512DB796;
	Mon, 19 Jan 2026 23:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WaEVp/Om"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5542DC762
	for <linux-input@vger.kernel.org>; Mon, 19 Jan 2026 23:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768864884; cv=pass; b=HnhsMMrhspuR9Rt7MkF5w2MLCF6LhXU3oV08ADIXQ1mtP4OYRtNYC7bOgVcE2txnVrWZ5bGAV/zktIaFPMmK+0bqqynF7X+IArC+zj/czM9BjrOvybYOmzFpx+aP2dRBRNlFsiJ66F5hVU1oWqN+zuqMH5Jq5Nmx1lYSbT5imn0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768864884; c=relaxed/simple;
	bh=YdLrpfctD2iaOxKslCuiUJ1fqUiNAufKSSGVvvwU4KE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I5JeqkfgtUg1jR15WW3Ob6mCC2IV4GfdQIf7cVYIcRaiNW1yhg6vxskg2ktYkAbGq1Al+FqQW06S0DWr9c/1RwjOKx4lJKNqNCKY9f4TquYzN0GoxxOYuxOdhQg2GGAZFe0Fh6vCcTL1PIVTrKv7W85j1nmcIqyafVP6Nz8PM/I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WaEVp/Om; arc=pass smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-59b78886454so5948444e87.2
        for <linux-input@vger.kernel.org>; Mon, 19 Jan 2026 15:21:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768864880; cv=none;
        d=google.com; s=arc-20240605;
        b=iBZYUwspJrbktLp+3fH3GqEEeOSX+pZeFiGUM1EpVggexuK7/Cgpp8zQsSPILb+dFU
         zeh1YwJUb5kEWhLbgZKD4tfbU4sRzbUWJNo/cVf7FF/kL0qFHGXjCOtNbOmGZTNWfIon
         UfIP6NUUF84rRi7DPkqMJIunhkdw/ojRi6oQaJgaNKFDKgVl+q5KRdo1Mt07XSitxS5z
         vXoPj9lawwPRKqyorM6Mf57Z6QWCj81whE/Xyg0CccLGuC0GuoUHV/5M6aDXwnO9lo2C
         fIUSq0GH4KCBYA+l3m2Ip6kvQXLDUjkGALgus5UQ+GqcQ/+OJD4AuA8wC1T0SPxCrv5o
         boSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=R6InNnz7iacJl3/TduXAj8W3uRVmL4OnpDkc9siuZ9s=;
        fh=Pjd8+5daFCsd9bs5SsoynAFVJBQMZNIAt7QeIdOoI0w=;
        b=V03qeLr5jC0dphEAKj9PjUEj9pYRjGwZ/Z9keFI86AW39GQOErgAyBUbOBh03vD5aj
         0H7pr+h3dgqy5kPBJJzp9kVbAZvQX976x3LSuaeEv50dtqpLB7bMyh2XTSH9zkIoGS4L
         YqPRBGKKVbrnrPfSc0b3pzJokDsp0qp9HRXldSmoSs4dbaL0fDMIv3UcAk8WtZW02H05
         WPb8ir/Es0Uh9uAfd64FwEYGiFi9K/7TihRaaunWnqD682rqPbEVxBLrVJmA0Cs4CXKj
         DxC/MSk1niFUw19tPJHBSWNpVcQL+rFu8xGNG3q77RUcoy8AaNyMsvB+HbPLgS09xt+t
         4TWw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768864880; x=1769469680; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R6InNnz7iacJl3/TduXAj8W3uRVmL4OnpDkc9siuZ9s=;
        b=WaEVp/OmqKIqk17b8S2wMU0OTXVwqstcFUjOmf8MeZnII39fn5dFpnt71GEuGKwtKX
         KCs4kK0tEi/1Jnw7aD2Op1GCHfcEqG0cqrgmyxhNTXcvsUR8YTS4xGn1HaaR2ZxI6vTW
         5elfb91Rk6gZ3WH1zcMf8o2vVOJLfu+9J/v3565IL2j5Ni7s0dB6pcOS8FqVtH61LHrI
         ayiyJ0hkZ5/UQ9K7EA8ujjsKweMN6aZh69tV03q8owAamkBmtHzFt0QosbZKnpseko7D
         4kleJo3gV4JbN2do/DB2wRRerz2u2aSiZ3yrLkDOXDGaRccTpe3dUZ6NcSSRRrxjCixq
         WLCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768864880; x=1769469680;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R6InNnz7iacJl3/TduXAj8W3uRVmL4OnpDkc9siuZ9s=;
        b=Hz8ocJFTPCSWIzbvBS57Sx/QkgsotE5fr7oZ+ytyrD88700jIxzzuI7NWDv1sPDme9
         U/L13f/oFFmp7O+Jx3+ncnXUF2DPxyMOVJnVhUnpqaSFu4HCiRCYRL1j1vIASxx9/3nm
         elYa0wOeJdNx0A8zIHvxobiSNR8xoLb6TILTLFdoYG1UXjSGKZMf+WpcfM/osG9r9YUJ
         iz7GrWF8RNjSyG9dlfsM1gOLVQStCvfYhZwI/pWw57PB53Arln7uypL1Y80dn0K0seKi
         kc/iEbEbfh4EHv2ivYEiDIZpDGCpHZiKBe7prs09BWrKkme0IVcZVYTdWy4OlvhJNNCz
         9QLA==
X-Forwarded-Encrypted: i=1; AJvYcCV4U8Z7kuGqmpNLIVWZIdLiaW0K9WzKGOr3M1WujK/fpzvipXozfwILWlhgbsnFaqOpQjADgkBGwTNjFg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0GmqrqcwdzPtldSWEQtB4/dyzf0D55C0kPkR3pZOdlKGALdmn
	4TcLX2dZpcQgeiLUizTuaeiYlwDOj41ljWnFYZXHarIOF7Ri60/+k7MaGATLsr2Iim9+HRERbtc
	WhwLjHgHnKmKj+eomEJ9J1yhoG4iPnhg=
X-Gm-Gg: AZuq6aKg+0AmeoJpJegqy0dHAtKrmkH3lkwwvtMh70wqCHZXo/RlwVmwANbvzQXBTMF
	tnKot+6pYfO/tE4nhMKy1aps3RRpmKxjRKgepi4RfkOcGigYvxMuC3dmy25ZLCcLiOHjdzvr9g+
	mKdBwoUQe1b3OrtvAx7Ik4T2Lan3XgqwJUS9dpAh5npB2rKzcq80Aw0zz0V8/LQtbvFJ3mv5lRM
	IOI0uaytpDN6HOiREGhLmQiPZZgzQmxclV7v2iYikyjJ/Y9n/A+suFymCT6OMbv2Inyupk=
X-Received: by 2002:a05:6512:3f0d:b0:59c:b818:c063 with SMTP id
 2adb3069b0e04-59dc8f11cc5mr49938e87.9.1768864879748; Mon, 19 Jan 2026
 15:21:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251226235101.106451-1-vishnuocv@gmail.com>
In-Reply-To: <20251226235101.106451-1-vishnuocv@gmail.com>
From: Vishnu Sankar <vishnuocv@gmail.com>
Date: Tue, 20 Jan 2026 08:20:43 +0900
X-Gm-Features: AZwV_Qha_AGcHlqJSZIc-uaFh5iazIYWt2QyAkghgDolNbh_GArBAIYfPOiBrsA
Message-ID: <CABxCQKu35Gc_+axoWD6pWuyFkbgWyRc67RP4iTsP8xw3U713PA@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] TrackPoint doubletap enablement and user control
To: dmitry.torokhov@gmail.com, hmh@hmh.eng.br, hansg@kernel.org, 
	ilpo.jarvinen@linux.intel.com, corbet@lwn.net, derekjohn.clark@gmail.com
Cc: mpearson-lenovo@squebb.ca, linux-doc@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, 
	vsankar@lenovo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi All,

I=E2=80=99m writing to kindly follow up on the patch series I have submitte=
d.

I haven=E2=80=99t seen any review feedback yet, so I just wanted to check i=
f it might
have been missed in the queue. If there=E2=80=99s anything I should revise,=
 test, or
clarify, I=E2=80=99d be happy to provide it.

Thank you for your time, and sorry for the inconvenience.

On Sat, Dec 27, 2025 at 8:53=E2=80=AFAM Vishnu Sankar <vishnuocv@gmail.com>=
 wrote:
>
> This patch series adds support for TrackPoint doubletap with a clear and
> simple separation of responsibilities between drivers:
>
> 1. Firmware enablement (trackpoint.c):
>    Automatically enables doubletap on capable hardware during device
>    detection.
>
> 2. User control (thinkpad_acpi.c):
>    Provides a sysfs interface to enable or disable delivery of doubletap
>    events to userspace.
>
> The approach follows the KISS principle:
> - The TrackPoint driver enables hardware functionality by default.
> - The thinkpad_acpi driver controls whether ACPI doubletap events are
>   delivered, using existing hotkey filtering infrastructure.
> - No cross-driver APIs or dual filtering paths are introduced.
>
> Changes in v5:
> - Rename sysfs attribute from doubletap_filter to doubletap_enable to
>   reflect actual behavior.
> - Fix inverted logic so events are delivered only when doubletap is
>   enabled.
> - Suppress ACPI hotkey delivery instead of injecting or filtering input
>   events.
> - Register the sysfs attribute via hotkey_attributes[] instead of
>   device_create_file().
> - Drop unnecessary helper wrappers and debug logging.
> - Update Documentation to reflect the new naming and semantics.
>
> Changes in v4:
> - Complete redesign based on reviewer feedback.
> - trackpoint.c: Simplified to only enable doubletap by default.
> - trackpoint.c: Removed all sysfs attributes and global variables.
> - trackpoint.c: Uses firmware ID detection with deny list.
> - thinkpad_acpi.c: Added sysfs interface for kernel-level event control.
> - thinkpad_acpi.c: No cross-driver dependencies.
> - Documentation: Updated to reflect simplified sysfs approach.
>
> Changes in v3:
> - No changes.
>
> Changes in v2:
> - Improved commit messages.
> - Removed unnecessary comments and debug messages.
> - Switched to strstarts() usage.
> - Simplified firmware capability detection logic.
>
> This version addresses the remaining review feedback by correcting the
> naming and logic inversion, aligning sysfs semantics with behavior, and
> fully integrating with existing thinkpad_acpi hotkey handling.
>
> Vishnu Sankar (3):
>   input: trackpoint - Enable doubletap by default on capable devices
>   platform/x86: thinkpad_acpi: Add sysfs control for TrackPoint
>     double-tap
>   Documentation: thinkpad-acpi - Document doubletap_enable attribute
>
>  .../admin-guide/laptops/thinkpad-acpi.rst     | 20 ++++++++
>  drivers/input/mouse/trackpoint.c              | 47 +++++++++++++++++++
>  drivers/input/mouse/trackpoint.h              |  5 ++
>  drivers/platform/x86/lenovo/thinkpad_acpi.c   | 42 ++++++++++++++---
>  4 files changed, 107 insertions(+), 7 deletions(-)
>
> --
> 2.51.0
>


--=20

Regards,

      Vishnu Sankar
     +817015150407 (Japan)

