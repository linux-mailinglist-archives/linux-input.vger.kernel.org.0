Return-Path: <linux-input+bounces-12591-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D6967AC4A10
	for <lists+linux-input@lfdr.de>; Tue, 27 May 2025 10:21:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 031F01891041
	for <lists+linux-input@lfdr.de>; Tue, 27 May 2025 08:22:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BADD248F5B;
	Tue, 27 May 2025 08:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JdmPRYW0"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90ECC1CDFAC;
	Tue, 27 May 2025 08:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748334114; cv=none; b=S6vytd/wLm0FoS0csL1iUG0Xy/bXzj5OfXIyq5K4RByHAu1r2IK9AXb+GXpNR/fk+fKB5mIeVF9jtOibIJHu5S1GJ8fOPFfpNxNq0q5sE5v2/q7VHCOxYu9NlAv73GJIGGfual/ZbLJPkRORcjnLm+tGfn+INbXgCejw01ogMes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748334114; c=relaxed/simple;
	bh=fGRUxXig1OkiQ7I+4LubHO556XNr6dsULyaQcEpiz+s=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=mE69Eln730cwaDjudVedKgRQVcnl6WLNdb/5K/9TWocWStEmOlglqhoAy54IfXB9fkxri6ZwutD02zjdLO6B+uv9GWd6HBHALnpxi656TdT3qp3NaZLZa4iV7CfS3tc76Oj4AiQvWQ1CHyr5QLabw+ukPPO0z9e6aMw8EyjjGGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JdmPRYW0; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4e59012c7eeso231008137.1;
        Tue, 27 May 2025 01:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748334111; x=1748938911; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fGRUxXig1OkiQ7I+4LubHO556XNr6dsULyaQcEpiz+s=;
        b=JdmPRYW0x7lxODzq+SZaRv37d46xtnlJpCSE/TvKb0+oAtt217TOPpN/MydsIopQnI
         sgMEKR+Ns62PoRGVMZSZfmwsewBSgOrTg1elGd+66J5kVynLrBbFEc2/3SFzrI2b9ppP
         sW1NgkqyE8V1CqXgYV40wOYb49o2B7emhMDs3z2ydTvECmCJQ7hZxMhyjEf4VFRxf/YS
         bBV7N2jkctqsf6eHhpZk4biwMqefMz9PPmJkdQJk7Q0r4fNLHDW+gRw8hmPKM711jSZp
         gXEc3g6Bh5L9vmvUsD83l6mlESrZFSE5jfyz7bjb/o45RMuyHUjGpJHbXhqbziuaKQBm
         2Gzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748334111; x=1748938911;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fGRUxXig1OkiQ7I+4LubHO556XNr6dsULyaQcEpiz+s=;
        b=uZ8LC1/lL7z+rvbHc3r99E7jFGl1qixe5iefN3G2Td+Cl5tLvOUx2wszdPIUf2NEjB
         ikF5kcKuG4NbHWR/QC04T+e5TCyKbGqqBem1tn5T/j+KDMpuQRMDgUvEut5IoKzthgqO
         h44oIYr8lTvgh80UXfLq/qeFhQ4qvI/9AARVINIdT4ZAWsMVaIjYoyv55gSkSvbLk7sZ
         vnl55y1igPJZpjBHcHB1Q2CZwPkLV/UaPhOnb1ItfIZCkVHFoo/kJ3qB93NL4yM2fqez
         4Dh5vEl1Bua9a+q3W2cgpWDm/dV6wWvTFlhs832dOhqYvwOSuEDCaNZOaNpQWho7I6i7
         oBXw==
X-Forwarded-Encrypted: i=1; AJvYcCXWYHTEDJQA+NtzO1dnMisrQOwK7OoqtEP0WsYyqeIiOIBuqkv2/vl3RNA/0zFaCyCn4VNzti1OUXtd1ZI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyTZvY2SI3tG2pXCFIYLGFIxzejeIt98bOeCvxJWWEHQqkU3VE
	vOEPz55uvHSXjfvEUYPINHD3jUcSAKMqBGvPZ/TWGurQccHsmbTWWHBp6x4UZzb9wsu0MBt/A67
	kTuv8OEgPTGu9R7TaJ9eJpFHYA0sHphc=
X-Gm-Gg: ASbGncsdt7to0jqn44BYOGOxAK2j46I9nQFPHapxYHbXxmDcS+XitmAd4I553aehAlt
	DzEbpzQXUsch0c0aLn8lcpOA0kOCuoBFDxVDMzkEa3GJ9GJ5Ztt+A381XCxINoboLNJjUIFrcT9
	iVksTUwB4ozlxc8WzZRDTwEolrTnNc9LuwLTpXG1ktpYvU
X-Google-Smtp-Source: AGHT+IEs/o92+7R6+zrngxif1aKf/Fww1tnED3/RogPqRSeFa6rQKP2MBBm4jueDAA1tL7nG4z3LVm893iITW/OCpgM=
X-Received: by 2002:a05:6102:2c05:b0:4e5:9380:9c20 with SMTP id
 ada2fe7eead31-4e59380a3c0mr305232137.2.1748334111328; Tue, 27 May 2025
 01:21:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Xianying Wang <wangxianying546@gmail.com>
Date: Tue, 27 May 2025 16:21:40 +0800
X-Gm-Features: AX0GCFvCVEmdiiVEQ2MZR8kWACRujl1p-_x9MbhRGO-okrzQsqo9bWPBeCgg8Mo
Message-ID: <CAOU40uDDL9-ivR=8nx67T9_j+1+2dCXNyBUqFvOPyv0cpPr5Yg@mail.gmail.com>
Subject: [BUG] general protection fault in input_unregister_device
To: dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I discovered a kernel crash described as "general protection fault in
input_unregister_device." The crash occurs in the input subsystem,
specifically in the function input_unregister_device
(drivers/input/input.c:2500), due to dereferencing a non-canonical
address, resulting in a general protection fault.

According to the crash report, the faulting address is
0xdffffc00000000a4, which corresponds to a KASAN shadow memory region.
The crash is triggered when mac_hid_toggle_emumouse calls
mac_hid_stop_emulation, which in turn invokes
mac_hid_destroy_emumouse, eventually leading to a call to
input_unregister_device with an invalid or uninitialized input_dev
pointer.

The report indicates that a corrupted or NULL input_dev structure was
passed into input_unregister_device, possibly due to a use-after-free,
double unregister, or incomplete initialization in the emumouse path
in mac_hid.

This can be reproduced on:

HEAD commit:

commit adc218676eef25575469234709c2d87185ca223a

report: https://pastebin.com/raw/4TeX6E8M

console output : https://pastebin.com/raw/ZE2AZ1Gq

kernel config : https://pastebin.com/raw/BpCtvUt2

C reproducer :

part1=EF=BC=9Ahttps://pastebin.com/raw/jhU9v99k

part2=EF=BC=9Ahttps://pastebin.com/raw/dcaKCHZ1

part3=EF=BC=9Ahttps://pastebin.com/raw/CzgGBb7C

part4=EF=BC=9Ahttps://pastebin.com/raw/MnwtYcjd

part5=EF=BC=9Ahttps://pastebin.com/raw/VE8xNmHT

Best regards,

Xianying

