Return-Path: <linux-input+bounces-6209-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D354F96C90C
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 22:59:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB6191C2534D
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 20:59:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EA2113B7A3;
	Wed,  4 Sep 2024 20:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cOV768ya"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7AD062A02;
	Wed,  4 Sep 2024 20:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725483564; cv=none; b=nXUH+1qfmZ1ZLzlU1ObH1iAngmoZjq9+9RwDY5WM/WptNc1dsb8IuGf6sa9icDH2AvFWh9SGJs6eMFFDk3OsYOfrOB8sx//urd7eWNJ9r63zBwULqZTCsyYcskuOGAMXt6Od1Qnl53Y6wMHOt3uwx3sWRsBCC+AdWlFaoLNvbhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725483564; c=relaxed/simple;
	bh=B+4SUieOV0kPO2Q6uYMR5/Q+4ouEMOo9s+x1Grwb9W8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dv0Bw+2sTgidiNCb2EbYNSQdJcyV+ynwTb3ayWgDG4MN7Sk0gsj1QS0+u16qu4n4vNTc8YkK89n7syXuy9ff2IyCzczWwLnb7koBn7u95pCAPzt7QN/nkpzrRnz102lql73wecWcSbtSpypKTOKS9USCER3IAqVrI5LQ+4vY83Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cOV768ya; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-7b0c9bbddb4so65600a12.3;
        Wed, 04 Sep 2024 13:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725483562; x=1726088362; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oamAtP00j9UzIW/E2M7cxd5f60RNaXNx3cnEHxE4DSY=;
        b=cOV768ya7lGts6hqYV1ZfnswcTn9UpOXc4DK2AgnBBjUnZftOY4mDUfNeDN7+j/uG6
         Btjb71i67JEq2bCYLdZY0n+cUpov56kBirQFHFVUJxSzeoN6pDd+UFs8AyOPLg/liQia
         sNWv4Cb5GRYj9MJnxPYYx6v4phbb6hNv4HELv/5BfEO5iovjjKEEZtcYbOFDUrF683l1
         zFq86LJOY/xoqgqC6AFoihOT+V/RdojztXFRjkcL35PIlD5oKKtMoPGaIMiPuEC7Cq51
         GpM2tO3aG7Hl75Fivx/8diTragUCFsjEraTYsUpstvSFX0RXd95QoAGEcL5DiCqpo0Fc
         zJKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725483562; x=1726088362;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oamAtP00j9UzIW/E2M7cxd5f60RNaXNx3cnEHxE4DSY=;
        b=JM/2RbK7Tdna6/7yDiX0/iOnTzUzUrS6pWAAEaXUxvku+KYivZTAXTo4Rpw3C0QiJ4
         Hg8/NjC1mPPSiUZ4w9mv0xyeHrZoq+fl7AzYHNkf7UJWXpUmiNVKa1CDYJtcXp45GNNV
         tPOhwDxVW3ljR0SsWLD2gi2SgjWr3vuoDXJ4YU2znV/SZYr58giodMCjKNcjutR9UqCJ
         KU8p84YDyD2Ec59IryKb8cr5F5reqfoKVktYt78F8mM6z3zp44+HTDXMvYu7vCj4mqtN
         4pUsfAla7He2wODTOcwhy1P5IpL8KlDnFh3WNfRvxYaQXcGLZnV2Q519Huh2lz1WuLXB
         FZeg==
X-Forwarded-Encrypted: i=1; AJvYcCUdw8E4/TTlKc1FuROhXdAKm4zRINXPtz8xJTeF+4woj0lkEzxUkQTeshfvzmEv50RA5DnLcIHamqKOBMk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRxb1ybOiP2MOmzV+k4Js6thSa4yMft94gz5uzYBmyljlfDZKz
	NkfTSvi6p5kMcc+opEouowiqUUiibqlrTB1wwvTuv6IUN7N8traC5nys9w==
X-Google-Smtp-Source: AGHT+IHMdOiLyJKdAYb9+dUc8xM/SQBZuAjhSxnu8uI7AcF5eXpixoQqbh6BeBpKHX/Y7hT01Y/Tlw==
X-Received: by 2002:a05:6a21:1693:b0:1ce:d6ea:2163 with SMTP id adf61e73a8af0-1ced6ea3fd6mr16323971637.25.1725483562104;
        Wed, 04 Sep 2024 13:59:22 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:13bd:b4e:4c0f:4c37])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7177859518esm2028458b3a.151.2024.09.04.13.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 13:59:21 -0700 (PDT)
Date: Wed, 4 Sep 2024 13:59:18 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: linux-input@vger.kernel.org,
	Michael Hennerich <michael.hennerich@analog.com>,
	Ville Syrjala <syrjala@sci.fi>,
	Support Opensource <support.opensource@diasemi.com>,
	Eddie James <eajames@linux.ibm.com>,
	Andrey Moiseev <o2g.org.ru@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Jeff LaBundy <jeff@labundy.com>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 17/22] Input: pegasus_notetaker - use guard notation when
 acquiring mutex
Message-ID: <ZtjKJsArLu3byTU6@google.com>
References: <20240904044244.1042174-1-dmitry.torokhov@gmail.com>
 <20240904044842.1048638-1-dmitry.torokhov@gmail.com>
 <a41bb88a-b624-4b5b-a2ea-b49761c45a93@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a41bb88a-b624-4b5b-a2ea-b49761c45a93@gmail.com>

Using guard notation makes the code more compact and error handling
more robust by ensuring that mutexes are released in all code paths
when control leaves critical section.

Reviewed-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

V2: fixed whitespace issues, added Reviewed-by from Javier

 drivers/input/tablet/pegasus_notetaker.c |   86 +++++++++++++++++-------------
 1 file changed, 48 insertions(+), 38 deletions(-)

diff --git a/drivers/input/tablet/pegasus_notetaker.c b/drivers/input/tablet/pegasus_notetaker.c
index a68da2988f9c..8d6b71d59793 100644
--- a/drivers/input/tablet/pegasus_notetaker.c
+++ b/drivers/input/tablet/pegasus_notetaker.c
@@ -214,6 +214,28 @@ static void pegasus_init(struct work_struct *work)
 			error);
 }
 
+static int __pegasus_open(struct pegasus *pegasus)
+{
+	int error;
+
+	guard(mutex)(&pegasus->pm_mutex);
+
+	pegasus->irq->dev = pegasus->usbdev;
+	if (usb_submit_urb(pegasus->irq, GFP_KERNEL))
+		return -EIO;
+
+	error = pegasus_set_mode(pegasus, PEN_MODE_XY, NOTETAKER_LED_MOUSE);
+	if (error) {
+		usb_kill_urb(pegasus->irq);
+		cancel_work_sync(&pegasus->init);
+		return error;
+	}
+
+	pegasus->is_open = true;
+
+	return 0;
+}
+
 static int pegasus_open(struct input_dev *dev)
 {
 	struct pegasus *pegasus = input_get_drvdata(dev);
@@ -223,39 +245,25 @@ static int pegasus_open(struct input_dev *dev)
 	if (error)
 		return error;
 
-	mutex_lock(&pegasus->pm_mutex);
-	pegasus->irq->dev = pegasus->usbdev;
-	if (usb_submit_urb(pegasus->irq, GFP_KERNEL)) {
-		error = -EIO;
-		goto err_autopm_put;
+	error = __pegasus_open(pegasus);
+	if (error) {
+		usb_autopm_put_interface(pegasus->intf);
+		return error;
 	}
 
-	error = pegasus_set_mode(pegasus, PEN_MODE_XY, NOTETAKER_LED_MOUSE);
-	if (error)
-		goto err_kill_urb;
-
-	pegasus->is_open = true;
-	mutex_unlock(&pegasus->pm_mutex);
 	return 0;
-
-err_kill_urb:
-	usb_kill_urb(pegasus->irq);
-	cancel_work_sync(&pegasus->init);
-err_autopm_put:
-	mutex_unlock(&pegasus->pm_mutex);
-	usb_autopm_put_interface(pegasus->intf);
-	return error;
 }
 
 static void pegasus_close(struct input_dev *dev)
 {
 	struct pegasus *pegasus = input_get_drvdata(dev);
 
-	mutex_lock(&pegasus->pm_mutex);
-	usb_kill_urb(pegasus->irq);
-	cancel_work_sync(&pegasus->init);
-	pegasus->is_open = false;
-	mutex_unlock(&pegasus->pm_mutex);
+	scoped_guard(mutex, &pegasus->pm_mutex) {
+		usb_kill_urb(pegasus->irq);
+		cancel_work_sync(&pegasus->init);
+
+		pegasus->is_open = false;
+	}
 
 	usb_autopm_put_interface(pegasus->intf);
 }
@@ -411,10 +419,10 @@ static int pegasus_suspend(struct usb_interface *intf, pm_message_t message)
 {
 	struct pegasus *pegasus = usb_get_intfdata(intf);
 
-	mutex_lock(&pegasus->pm_mutex);
+	guard(mutex)(&pegasus->pm_mutex);
+
 	usb_kill_urb(pegasus->irq);
 	cancel_work_sync(&pegasus->init);
-	mutex_unlock(&pegasus->pm_mutex);
 
 	return 0;
 }
@@ -422,31 +430,33 @@ static int pegasus_suspend(struct usb_interface *intf, pm_message_t message)
 static int pegasus_resume(struct usb_interface *intf)
 {
 	struct pegasus *pegasus = usb_get_intfdata(intf);
-	int retval = 0;
 
-	mutex_lock(&pegasus->pm_mutex);
+	guard(mutex)(&pegasus->pm_mutex);
+
 	if (pegasus->is_open && usb_submit_urb(pegasus->irq, GFP_NOIO) < 0)
-		retval = -EIO;
-	mutex_unlock(&pegasus->pm_mutex);
+		return -EIO;
 
-	return retval;
+	return 0;
 }
 
 static int pegasus_reset_resume(struct usb_interface *intf)
 {
 	struct pegasus *pegasus = usb_get_intfdata(intf);
-	int retval = 0;
+	int error;
+
+	guard(mutex)(&pegasus->pm_mutex);
 
-	mutex_lock(&pegasus->pm_mutex);
 	if (pegasus->is_open) {
-		retval = pegasus_set_mode(pegasus, PEN_MODE_XY,
+		error = pegasus_set_mode(pegasus, PEN_MODE_XY,
 					  NOTETAKER_LED_MOUSE);
-		if (!retval && usb_submit_urb(pegasus->irq, GFP_NOIO) < 0)
-			retval = -EIO;
+		if (error)
+			return error;
+
+		if (usb_submit_urb(pegasus->irq, GFP_NOIO) < 0)
+			return -EIO;
 	}
-	mutex_unlock(&pegasus->pm_mutex);
 
-	return retval;
+	return 0;
 }
 
 static const struct usb_device_id pegasus_ids[] = {

