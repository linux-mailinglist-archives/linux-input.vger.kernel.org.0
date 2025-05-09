Return-Path: <linux-input+bounces-12250-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4355AB0F87
	for <lists+linux-input@lfdr.de>; Fri,  9 May 2025 11:47:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3BD93503758
	for <lists+linux-input@lfdr.de>; Fri,  9 May 2025 09:47:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F79F28A71C;
	Fri,  9 May 2025 09:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tesarici.cz header.i=@tesarici.cz header.b="GBms+Tn/"
X-Original-To: linux-input@vger.kernel.org
Received: from bee.tesarici.cz (bee.tesarici.cz [37.205.15.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED38266B44
	for <linux-input@vger.kernel.org>; Fri,  9 May 2025 09:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.15.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746784069; cv=none; b=jvixSpYcZrdcyR8pABA71wzhcqvXU3ygTt289QnTZMIdKXXeA+M9UVNzasdhwX5u9xGPpPcs1WEknsxYmLHR3u2NUyoRAy94xjwXYBY4YIiXe96I5Cgw7NFnRuDVZuief8So856ow5iOU0otb7N7V9Hs04FaTljVqKdV45rU0bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746784069; c=relaxed/simple;
	bh=XKJRjBrKpqKOqeROZZDxgL88J/hS4xAJ0NX3cks1Dgo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Vgb6mvuUbEDh6j4h7m1PfL0XXCodogPGKHYvQ3A4mI4IZKAKgGqEpuH3k3z8UIfbAMkmhgK5cqrh3kbhH7/mC9ux+rgHTerLZiCiDKaoWyxt/xEVP7412h81vcnldW2PR5AIyMXWfNdENfXbHqq8Rz1pXfb19NGC8vwIGIds2gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tesarici.cz; spf=pass smtp.mailfrom=tesarici.cz; dkim=pass (2048-bit key) header.d=tesarici.cz header.i=@tesarici.cz header.b=GBms+Tn/; arc=none smtp.client-ip=37.205.15.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tesarici.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tesarici.cz
Received: from meshulam.tesarici.cz (dynamic-2a00-1028-83b8-1e7a-4427-cc85-6706-c595.ipv6.o2.cz [IPv6:2a00:1028:83b8:1e7a:4427:cc85:6706:c595])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by bee.tesarici.cz (Postfix) with ESMTPSA id 0B5C921E552;
	Fri,  9 May 2025 11:39:07 +0200 (CEST)
Authentication-Results: mail.tesarici.cz; dmarc=fail (p=quarantine dis=none) header.from=tesarici.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tesarici.cz; s=mail;
	t=1746783547; bh=mkBW3qrhohXw5xWxw7kQ2NzDlzGFlQxoKSzdTY74tUI=;
	h=Date:From:To:Cc:Subject:From;
	b=GBms+Tn/A8v5S8KZJbFOm4VSrNj2pA+dIpOOsfsuIp17D8y7ce2+4OUCrt2tlYybm
	 A8GXSB7GRNfSuh0KWnAmXarbxA2yV8/PyGpqBuHslkihn/HH4HPYeCaPsKhoTv9Tn9
	 9tKHl3T6opnxnEgHMLXqL7cYUEgnBEeRVQllX1iS4MLMneoROGPlhI582m05638kvc
	 tHcUBPJfzvLN2DJ3+sMUox9ll7P9ctP+PSikbsnFQQI4R2KA0Nfh7I5d71U88onfjU
	 aVOtjVfP9mbciPcuGKJs8FsLD370B0YqaO30vCcsVsd9Lpl/HnWDDI8htQO7rdwlO4
	 gY7/+OpFtvImw==
Date: Fri, 9 May 2025 11:39:05 +0200
From: Petr =?UTF-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org
Subject: Use after free in dispatch_hid_bpf_output_report()
Message-ID: <20250509113905.34947e78@meshulam.tesarici.cz>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi all,

after installing v6.15-rc5 on my laptop, I'm running into an invalid
pointer dereference in dispatch_hid_bpf_output_report() on suspend. I
added some debugging messages (see patch below), and I can see this
sequence of events:

[ 1568.571776] [   T7420] PM: suspend entry (deep)
[ 1568.602245] [   T7420] Filesystems sync: 0.030 seconds
[ 1568.613183] [   T1704] hid-generic 0005:04F2:182A.0004: CLEANED UP srcu 00000000b7570e01
[ 1568.613348] [    T724] hid-generic 0005:04F2:182A.0004: UAF srcu 00000000b7570e01
[ 1568.616215] [   T7420] Freezing user space processes

The HID device is a Bluetooth keyboard (using bluez 5.79), which
(presumably) gets disconnected on suspend.

FTR I didn't encounter any such issues with v6.14.

Petr T

diff --git a/drivers/hid/bpf/hid_bpf_dispatch.c b/drivers/hid/bpf/hid_bpf_dispatch.c
index 2e96ec6a3073..f284175e8b0b 100644
--- a/drivers/hid/bpf/hid_bpf_dispatch.c
+++ b/drivers/hid/bpf/hid_bpf_dispatch.c
@@ -130,6 +130,11 @@ int dispatch_hid_bpf_output_report(struct hid_device *hdev,
 	struct hid_bpf_ops *e;
 	int ret, idx;
 
+	if (unlikely(!hdev->bpf.srcu.sda)) {
+		hid_warn(hdev, "UAF srcu %p", &hdev->bpf.srcu);
+		return 0;
+	}
+
 	idx = srcu_read_lock(&hdev->bpf.srcu);
 	list_for_each_entry_srcu(e, &hdev->bpf.prog_list, list,
 				 srcu_read_lock_held(&hdev->bpf.srcu)) {
@@ -143,6 +148,8 @@ int dispatch_hid_bpf_output_report(struct hid_device *hdev,
 	ret = 0;
 
 out:
+	if (unlikely(!hdev->bpf.srcu.sda))
+		hid_warn(hdev, "RACE srcu %p", &hdev->bpf.srcu);
 	srcu_read_unlock(&hdev->bpf.srcu, idx);
 	return ret;
 }
@@ -631,6 +638,7 @@ void hid_bpf_destroy_device(struct hid_device *hdev)
 
 	synchronize_srcu(&hdev->bpf.srcu);
 	cleanup_srcu_struct(&hdev->bpf.srcu);
+	hid_info(hdev, "CLEANED UP srcu %p", &hdev->bpf.srcu);
 }
 EXPORT_SYMBOL_GPL(hid_bpf_destroy_device);
 

