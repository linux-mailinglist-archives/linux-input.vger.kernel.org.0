Return-Path: <linux-input+bounces-4300-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 58AFC902759
	for <lists+linux-input@lfdr.de>; Mon, 10 Jun 2024 18:59:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3D311B2CADA
	for <lists+linux-input@lfdr.de>; Mon, 10 Jun 2024 16:58:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93179757E3;
	Mon, 10 Jun 2024 16:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lucW27f2"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D487E1EA8F;
	Mon, 10 Jun 2024 16:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718038684; cv=none; b=DOHFIIyKbZluj6rlNf71lDm2XcbFYKqVd13/4+qmlMi/YY2D5ccLqY0ND1BPqrTbgnzsjnxfBt6oMuIX6e1SDvPh1iF4uWHvq2Am1qV4URKfgU76377MolCa9mrrJ4H0ksGD+jgksOHv7oC7Za0VLe+WL5/JFn4XPkGl2oC/1Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718038684; c=relaxed/simple;
	bh=GbHdTLYub+sD5dM94PZbMo3MaJnKZiE5cFXrl5fkjXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DqeVDBCYyUl27SO4GCnuPxiGcD4lnSpSNdQA/DhSKQJr1o+FDHu3hDD+A/oaND+YYUdsntpYswgpE+H1ElTfooXeZ5aPFdxGY8icnK+Ha2EXY6KlrxfMYPlP5J2gyfgXC9FDzN2yY+M9y+qYCSjOam95Cdnn7F/QRX4HItE/tmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lucW27f2; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-35f1e35156cso1449206f8f.1;
        Mon, 10 Jun 2024 09:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718038681; x=1718643481; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YzhH3IOabREM20REb/myGlikn8tIz8znLMQG7lX39H0=;
        b=lucW27f288qBMrV/Y6MmNrn0ShEVENXd3LS+2Cf2OI5DNUtnoiBjB5xQ0fMPtg5ejg
         e465ImeOi+Xd8yPb9v0ukyWOsmmJppURrfa7WyTu5bDgM8vleNC4im1XSQ+QuwX3MxmF
         b+7zcYrXybEPMxkuHtENbefRmAexdBqiF/wYLN9In4pBuPu2p0NapkA4/cKWZ4Jv+o3X
         yzd7Ky/7dlQZcTbxHe3SJaSc0hEvZuI3S28BjPTMo22trRt7VbkktLz2j/9GQKFsNMw7
         9IyaOBHtwrvPYgtA7WgOYkmGRGOqxY9qc6sXqnritkEzQjdUwUsJOgG55CLkt8be/tm7
         Ue/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718038681; x=1718643481;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YzhH3IOabREM20REb/myGlikn8tIz8znLMQG7lX39H0=;
        b=NBsFVhvfy/m7Sr+FMS4O1fPEghYwOHyWCOB4Jg0frdjb0KvZGZjG7D5HxuKeCXXZXw
         vAHZ9RygUei6Uzosv76p1B0icY+f6Xw7Hijf4D3+948KhwakW4GWJRfzIyEe/ECyZMuF
         wenNGFnVqD0mbhiV2nVYey1NwUEzhuM7/5G/sfCl+POokq7ePfCapeQYIe7XFgBOyZgf
         zhajeU/kZFtB+owvjDlkwrjqJC5CJwPjBnq6vxe/jKgnVNo2xvChv0UnqmnFhlbp6ul/
         teQ1Wu/L6hONS7NPax64vvo1/Z2FJY+3lFwTWe35FL7ISC+cgDRDJC5ihPw4IqvB6/oL
         T+Qg==
X-Forwarded-Encrypted: i=1; AJvYcCUb1M23iM+nu8I0TA0yk7k4wVTsCqawRzvCbbHtv+FrMKpG1ksAvv9YA5EIjvN0/d9vB42tj3X0H2A23V03N1kPpVK7NTYqvUb0drpM/P5kcEUlYR5bJkPdrBqORFy7nVpdKV4O6K6DUBg=
X-Gm-Message-State: AOJu0Yx6bessLHYRKMB9G81iq2GfIpltRmEiH+CN0dUISLbwDyIJ9YAn
	s0Xka3Ur/SJKXttd9i1anwwjEGmvyWqDmErxwBNioJepNsAFNQ2t
X-Google-Smtp-Source: AGHT+IG+QPm7gKyzny8UH/DTLMeR8S6+4sdE41Ci4AqJdc31dcZI00ajdyOAPOBqiAWKX9RhsM3lkA==
X-Received: by 2002:a5d:53c3:0:b0:35f:234a:9c0e with SMTP id ffacd0b85a97d-35f234a9cd9mr2638920f8f.30.1718038681005;
        Mon, 10 Jun 2024 09:58:01 -0700 (PDT)
Received: from fedora ([213.94.26.172])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35f25dc3f07sm2554737f8f.79.2024.06.10.09.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 09:58:00 -0700 (PDT)
Date: Mon, 10 Jun 2024 18:57:58 +0200
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Rahul Rameshbabu <rrameshbabu@nvidia.com>,
	Fabio Baltieri <fabiobaltieri@chromium.org>,
	Ivan Gorinov <linux-kernel@altimeter.info>,
	Johannes Roith <johannes@gnu-linux.rocks>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: uclogic: avoid linking common code into multiple
 modules
Message-ID: <Zmcwlt6Kfpt09tKi@fedora>
References: <20240529094816.1859073-1-arnd@kernel.org>
 <ZmSi5_-4mD4AaIJW@fedora>
 <54c19328-35e2-4506-aa3a-a0b08813d873@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <54c19328-35e2-4506-aa3a-a0b08813d873@app.fastmail.com>

On Mon, Jun 10, 2024 at 08:24:51AM +0200, Arnd Bergmann wrote:
> On Sat, Jun 8, 2024, at 20:28, José Expósito wrote:
> > On Wed, May 29, 2024 at 11:48:05AM +0200, Arnd Bergmann wrote:
> 
> >> @@ -154,10 +152,8 @@ obj-$(CONFIG_HID_WINWING)	+= hid-winwing.o
> >>  obj-$(CONFIG_HID_SENSOR_HUB)	+= hid-sensor-hub.o
> >>  obj-$(CONFIG_HID_SENSOR_CUSTOM_SENSOR)	+= hid-sensor-custom.o
> >>  
> >> -hid-uclogic-test-objs		:= hid-uclogic-rdesc.o \
> >> -				   hid-uclogic-params.o \
> >> -				   hid-uclogic-rdesc-test.o
> >> -obj-$(CONFIG_HID_KUNIT_TEST)	+= hid-uclogic-test.o
> >> +hid-uclogic-test-objs		:= hid-uclogic-rdesc-test.o
> >> +obj-$(CONFIG_HID_KUNIT_TEST)	+= hid-uclogic-test.o hid-uclogic-params.o hid-uclogic-params.o
> >>  
> >>  obj-$(CONFIG_USB_HID)		+= usbhid/
> >>  obj-$(CONFIG_USB_MOUSE)		+= usbhid/
> >
> > I tested your patch with:
> >
> > 	hid-uclogic-objs		:= hid-uclogic-core.o \
> > 					   hid-uclogic-rdesc.o \
> > 					   hid-uclogic-params.o
> > 	obj-$(CONFIG_HID_UCLOGIC)	+= hid-uclogic.o
> > 	[...]
> > 	hid-uclogic-test-objs		:= hid-uclogic-rdesc-test.o
> > 	obj-$(CONFIG_HID_KUNIT_TEST)	+= hid-uclogic.o hid-uclogic-test.o
> >
> > And I think it is a bit more clear and it looks like it does the trick
> > removing the warning.
> 
> Right, that seems fine.
> 
> > Also, with that change only "EXPORT_SYMBOL_GPL(uclogic_rdesc_template_apply);"
> > is required. The other EXPORT_SYMBOL_GPL can be removed.
> >
> > However, I'm not sure about what are the best practices using EXPORT_SYMBOL_GPL
> > and if it should be used for each function/data in the .h file. Maybe that's
> > why you added them.
> 
> No, having only the single export is better here, you should
> have as few of them as possible. I did picked the more complicated
> approach as I wasn't sure if loading the entire driver from the
> test module caused any problems. Let's use your simpler patch
> then.
> 
>      Arnd

Turns out that, since the last time I checked the KUnit docs,
we have "EXPORT_SYMBOL_IF_KUNIT" available now.

I think we can use it and your final patch, without the MODULE_*
changes, could look like:

diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
index ce71b53ea6c5..e40f1ddebbb7 100644
--- a/drivers/hid/Makefile
+++ b/drivers/hid/Makefile
@@ -154,10 +154,8 @@ obj-$(CONFIG_HID_WINWING)  += hid-winwing.o
 obj-$(CONFIG_HID_SENSOR_HUB)   += hid-sensor-hub.o
 obj-$(CONFIG_HID_SENSOR_CUSTOM_SENSOR) += hid-sensor-custom.o
 
-hid-uclogic-test-objs          := hid-uclogic-rdesc.o \
-                                  hid-uclogic-params.o \
-                                  hid-uclogic-rdesc-test.o
-obj-$(CONFIG_HID_KUNIT_TEST)   += hid-uclogic-test.o
+hid-uclogic-test-objs          := hid-uclogic-rdesc-test.o
+obj-$(CONFIG_HID_KUNIT_TEST)   += hid-uclogic.o hid-uclogic-test.o
 
 obj-$(CONFIG_USB_HID)          += usbhid/
 obj-$(CONFIG_USB_MOUSE)                += usbhid/
diff --git a/drivers/hid/hid-uclogic-rdesc.c b/drivers/hid/hid-uclogic-rdesc.c
index b6dfdf6356a6..6c7a90417569 100644
--- a/drivers/hid/hid-uclogic-rdesc.c
+++ b/drivers/hid/hid-uclogic-rdesc.c
@@ -17,6 +17,7 @@
 #include "hid-uclogic-rdesc.h"
 #include <linux/slab.h>
 #include <asm/unaligned.h>
+#include <kunit/visibility.h>
 
 /* Fixed WP4030U report descriptor */
 __u8 uclogic_rdesc_wp4030u_fixed_arr[] = {
@@ -1242,3 +1243,4 @@ __u8 *uclogic_rdesc_template_apply(const __u8 *template_ptr,
 
        return rdesc_ptr;
 }
+EXPORT_SYMBOL_IF_KUNIT(uclogic_rdesc_template_apply);

I hope that helps,
Jose

