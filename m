Return-Path: <linux-input+bounces-14229-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C36DB2F173
	for <lists+linux-input@lfdr.de>; Thu, 21 Aug 2025 10:25:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5FAC018876C2
	for <lists+linux-input@lfdr.de>; Thu, 21 Aug 2025 08:20:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 437DD2EA73B;
	Thu, 21 Aug 2025 08:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tbnso8q+"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1973A2EA735;
	Thu, 21 Aug 2025 08:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755764203; cv=none; b=sYLc4nDUMTJC9nGNqCIddzrP9ZbB4xHkEfqkI7oEYL6R3YfKsSzOvsE531TUoV91N9KM/rtcT/FFGPEICkN49clWeblYGBjXOO0z8VyJsPt0HWqcYFCSu+AIFf6j93bnXNp1GXr+BrUcQnCUZe7FqzSeOBKA90a77o98ek95HqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755764203; c=relaxed/simple;
	bh=Ca6QHQ9vEpmHUY404TIoWEsfTKt5bP+PBr6sq9pAd8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BamvxiBSYBEm5TGn8Ygp/B7ARBy21yezfgQn8aHlbMBmfvlOX4Oi8fL1lfTOl8rM3bsplMz6LPc7q2D2xY+OybL4apLVE3wqBDaXSgSDDureQhrlYpS0kceWnnQVOzeedChLR5uv5dQihz3z3uBI7iP6m4Pk90Q4h6MmakDAZ3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tbnso8q+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 326B9C4CEF4;
	Thu, 21 Aug 2025 08:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755764202;
	bh=Ca6QHQ9vEpmHUY404TIoWEsfTKt5bP+PBr6sq9pAd8M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tbnso8q+QZPteuBBnDp0I+QFymfoNNEP656pcxDidlg7TokvSqnCWAeB2DMDo3YmH
	 sz2qmV7TSSwuBuqr3jXGKqdfjOe95IzutqE59nLs3Gl5MZv0Ojal2Bdi+K2zZafQRa
	 RI6D0GJH/4viTDd2dufQOwu2OiFwBGbWL5DcOIxuJ0fc9AKFZbCrEO4MuU2aPOO+v4
	 Xo23PEpM63LFR96Cis31Gz/xOHQe6BxU9cJNRDdKmCObwEu3vNKU+OxGJk7iI11Oxd
	 AA7VPEn237GfE6PrBXMoLiW7Bq1JbIYNV+Tw4XlQyc5suG6FXAzu4rcmdDZL5BuaQZ
	 GDJQ7+b7jLCUQ==
Date: Thu, 21 Aug 2025 10:16:38 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
	Peter Hutterer <peter.hutterer@who-t.net>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: tighten ioctl command parsing
Message-ID: <5ifdihuppriqhwdmf3e53vfun55vokia2slcjwanyvysyo65ll@awjspbpood2o>
References: <20250711072847.2836962-1-arnd@kernel.org>
 <cznzhmuizk6r3tv7ze6lqp3qoyfnu6ktmbwxbjpsf5phthsjoj@x46mthdr66l7>
 <6432a849-512d-4abb-b15a-c2f1b7dd6533@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6432a849-512d-4abb-b15a-c2f1b7dd6533@app.fastmail.com>

On Jul 11 2025, Arnd Bergmann wrote:
> On Fri, Jul 11, 2025, at 11:40, Benjamin Tissoires wrote:
> >
> > On Jul 11 2025, Arnd Bergmann wrote:
> >> From: Arnd Bergmann <arnd@arndb.de>
> >> 
> >> The handling for variable-length ioctl commands in hidraw_ioctl() is
> >> rather complex and the check for the data direction is incomplete.
> >> 
> >> Simplify this code using a switch() statement with the size masked
> >> out, to ensure the rest of the command is correctly matched.
> >
> > How much "urgent" you believe this patch is. I would say 6.17 material,
> > but I'm not sure if your analysis regarding "the check for the data
> > direction is incomplete." would justify a 6.16 late fix.
> 
> I'm not aware of anything being actively broken without my patch,
> the driver just accepts extra commands that it should reject instead.
> 
> My feeling is that we still want the change backported to stable
> kernels as it does address incorrect behavior, and based on that
> it should be in a fixes branch for the current release rather than
> wait for the merge window.
> 
> On the other hand, it needs to be properly tested to ensure
> I'm not breaking things.
> 
> > Also, lately I added a new tools/testing/selftests/hid/hidraw.c to test
> > the latest HIDIOCREVOKE addition. I wonder if we should not add a couple
> > of checks there to ensure we get the different kind of other ioctls
> > tested before and after this patch.

FWIW, I was told to use more AI in my company, and I was too lazy to
write a full coverage. So I asked claude to help me out on that and the
result is pasted down below. Feel free to include them in v2 (note:
checkpatch complains about the co-developed-by tag, but not sure we have
a concensus for that ATM).

> 
> Yes, makes sense, e.g. testing HIDIOCGFEATURE with incorrect _IOC_DIR
> bits would be a useful addition.

The current behaviour for HIDIOCGRAWNAME with a wrong _IOC_DIR bit is to
return -EINVAL, while with your patch applied it's changed to -ENOTTY.
Is that expected?

---

From 71110ae5e5f30e0bfe529faf8987d676410f053f Mon Sep 17 00:00:00 2001
From: Benjamin Tissoires <bentiss@kernel.org>
Date: Thu, 21 Aug 2025 09:42:34 +0200
Subject: [PATCH 2/3] selftests/hid: hidraw: add more coverage for hidraw
 ioctls

Try to ensure all ioctls are having at least one test.

Co-developed-by: claude-4-sonnet
Signed-off-by: Benjamin Tissoires <bentiss@kernel.org>
---
 tools/testing/selftests/hid/hid_common.h |   6 +
 tools/testing/selftests/hid/hidraw.c     | 346 +++++++++++++++++++++++
 2 files changed, 352 insertions(+)

diff --git a/tools/testing/selftests/hid/hid_common.h b/tools/testing/selftests/hid/hid_common.h
index f77f69c6657d..8085519c47cb 100644
--- a/tools/testing/selftests/hid/hid_common.h
+++ b/tools/testing/selftests/hid/hid_common.h
@@ -230,6 +230,12 @@ static int uhid_event(struct __test_metadata *_metadata, int fd)
 		break;
 	case UHID_SET_REPORT:
 		UHID_LOG("UHID_SET_REPORT from uhid-dev");
+
+		answer.type = UHID_SET_REPORT_REPLY;
+		answer.u.set_report_reply.id = ev.u.set_report.id;
+		answer.u.set_report_reply.err = 0; /* success */
+
+		uhid_write(_metadata, fd, &answer);
 		break;
 	default:
 		TH_LOG("Invalid event from uhid-dev: %u", ev.type);
diff --git a/tools/testing/selftests/hid/hidraw.c b/tools/testing/selftests/hid/hidraw.c
index 821db37ba4bb..6d61d03e2ef0 100644
--- a/tools/testing/selftests/hid/hidraw.c
+++ b/tools/testing/selftests/hid/hidraw.c
@@ -2,6 +2,9 @@
 /* Copyright (c) 2022-2024 Red Hat */
 
 #include "hid_common.h"
+#include <linux/input.h>
+#include <string.h>
+#include <sys/ioctl.h>
 
 /* for older kernels */
 #ifndef HIDIOCREVOKE
@@ -215,6 +218,349 @@ TEST_F(hidraw, write_event_revoked)
 	pthread_mutex_unlock(&uhid_output_mtx);
 }
 
+/*
+ * Test HIDIOCGRDESCSIZE ioctl to get report descriptor size
+ */
+TEST_F(hidraw, ioctl_rdescsize)
+{
+	int desc_size = 0;
+	int err;
+
+	/* call HIDIOCGRDESCSIZE ioctl */
+	err = ioctl(self->hidraw_fd, HIDIOCGRDESCSIZE, &desc_size);
+	ASSERT_EQ(err, 0) TH_LOG("HIDIOCGRDESCSIZE ioctl failed");
+
+	/* verify the size matches our test report descriptor */
+	ASSERT_EQ(desc_size, sizeof(rdesc))
+		TH_LOG("expected size %zu, got %d", sizeof(rdesc), desc_size);
+}
+
+/*
+ * Test HIDIOCGRDESC ioctl to get report descriptor data
+ */
+TEST_F(hidraw, ioctl_rdesc)
+{
+	struct hidraw_report_descriptor desc;
+	int err;
+
+	/* get the full report descriptor */
+	desc.size = sizeof(rdesc);
+	err = ioctl(self->hidraw_fd, HIDIOCGRDESC, &desc);
+	ASSERT_EQ(err, 0) TH_LOG("HIDIOCGRDESC ioctl failed");
+
+	/* verify the descriptor data matches our test descriptor */
+	ASSERT_EQ(memcmp(desc.value, rdesc, sizeof(rdesc)), 0)
+		TH_LOG("report descriptor data mismatch");
+}
+
+/*
+ * Test HIDIOCGRDESC ioctl with smaller buffer size
+ */
+TEST_F(hidraw, ioctl_rdesc_small_buffer)
+{
+	struct hidraw_report_descriptor desc;
+	int err;
+	size_t small_size = sizeof(rdesc) / 2; /* request half the descriptor size */
+
+	/* get partial report descriptor */
+	desc.size = small_size;
+	err = ioctl(self->hidraw_fd, HIDIOCGRDESC, &desc);
+	ASSERT_EQ(err, 0) TH_LOG("HIDIOCGRDESC ioctl failed with small buffer");
+
+	/* verify we got the first part of the descriptor */
+	ASSERT_EQ(memcmp(desc.value, rdesc, small_size), 0)
+		TH_LOG("partial report descriptor data mismatch");
+}
+
+/*
+ * Test HIDIOCGRAWINFO ioctl to get device information
+ */
+TEST_F(hidraw, ioctl_rawinfo)
+{
+	struct hidraw_devinfo devinfo;
+	int err;
+
+	/* get device info */
+	err = ioctl(self->hidraw_fd, HIDIOCGRAWINFO, &devinfo);
+	ASSERT_EQ(err, 0) TH_LOG("HIDIOCGRAWINFO ioctl failed");
+
+	/* verify device info matches our test setup */
+	ASSERT_EQ(devinfo.bustype, BUS_USB)
+		TH_LOG("expected bustype 0x03, got 0x%x", devinfo.bustype);
+	ASSERT_EQ(devinfo.vendor, 0x0001)
+		TH_LOG("expected vendor 0x0001, got 0x%x", devinfo.vendor);
+	ASSERT_EQ(devinfo.product, 0x0a37)
+		TH_LOG("expected product 0x0a37, got 0x%x", devinfo.product);
+}
+
+/*
+ * Test HIDIOCGFEATURE ioctl to get feature report
+ */
+TEST_F(hidraw, ioctl_gfeature)
+{
+	__u8 buf[10] = {0};
+	int err;
+
+	/* set report ID 1 in first byte */
+	buf[0] = 1;
+
+	/* get feature report */
+	err = ioctl(self->hidraw_fd, HIDIOCGFEATURE(sizeof(buf)), buf);
+	ASSERT_EQ(err, sizeof(feature_data)) TH_LOG("HIDIOCGFEATURE ioctl failed, got %d", err);
+
+	/* verify we got the expected feature data */
+	ASSERT_EQ(buf[0], feature_data[0])
+		TH_LOG("expected feature_data[0] = %d, got %d", feature_data[0], buf[0]);
+	ASSERT_EQ(buf[1], feature_data[1])
+		TH_LOG("expected feature_data[1] = %d, got %d", feature_data[1], buf[1]);
+}
+
+/*
+ * Test HIDIOCGFEATURE ioctl with invalid report ID
+ */
+TEST_F(hidraw, ioctl_gfeature_invalid)
+{
+	__u8 buf[10] = {0};
+	int err;
+
+	/* set invalid report ID (not 1) */
+	buf[0] = 2;
+
+	/* try to get feature report */
+	err = ioctl(self->hidraw_fd, HIDIOCGFEATURE(sizeof(buf)), buf);
+	ASSERT_LT(err, 0) TH_LOG("HIDIOCGFEATURE should have failed with invalid report ID");
+	ASSERT_EQ(errno, EIO) TH_LOG("expected EIO, got errno %d", errno);
+}
+
+/*
+ * Test HIDIOCSFEATURE ioctl to set feature report
+ */
+TEST_F(hidraw, ioctl_sfeature)
+{
+	__u8 buf[10] = {0};
+	int err;
+
+	/* prepare feature report data */
+	buf[0] = 1; /* report ID */
+	buf[1] = 0x42;
+	buf[2] = 0x24;
+
+	/* set feature report */
+	err = ioctl(self->hidraw_fd, HIDIOCSFEATURE(3), buf);
+	ASSERT_EQ(err, 3) TH_LOG("HIDIOCSFEATURE ioctl failed, got %d", err);
+
+	/*
+	 * Note: The uhid mock doesn't validate the set report data,
+	 * so we just verify the ioctl succeeds
+	 */
+}
+
+/*
+ * Test HIDIOCGINPUT ioctl to get input report
+ */
+TEST_F(hidraw, ioctl_ginput)
+{
+	__u8 buf[10] = {0};
+	int err;
+
+	/* set report ID 1 in first byte */
+	buf[0] = 1;
+
+	/* get input report */
+	err = ioctl(self->hidraw_fd, HIDIOCGINPUT(sizeof(buf)), buf);
+	ASSERT_EQ(err, sizeof(feature_data)) TH_LOG("HIDIOCGINPUT ioctl failed, got %d", err);
+
+	/* verify we got the expected input data */
+	ASSERT_EQ(buf[0], feature_data[0])
+		TH_LOG("expected feature_data[0] = %d, got %d", feature_data[0], buf[0]);
+	ASSERT_EQ(buf[1], feature_data[1])
+		TH_LOG("expected feature_data[1] = %d, got %d", feature_data[1], buf[1]);
+}
+
+/*
+ * Test HIDIOCGINPUT ioctl with invalid report ID
+ */
+TEST_F(hidraw, ioctl_ginput_invalid)
+{
+	__u8 buf[10] = {0};
+	int err;
+
+	/* set invalid report ID (not 1) */
+	buf[0] = 2;
+
+	/* try to get input report */
+	err = ioctl(self->hidraw_fd, HIDIOCGINPUT(sizeof(buf)), buf);
+	ASSERT_LT(err, 0) TH_LOG("HIDIOCGINPUT should have failed with invalid report ID");
+	ASSERT_EQ(errno, EIO) TH_LOG("expected EIO, got errno %d", errno);
+}
+
+/*
+ * Test HIDIOCSINPUT ioctl to set input report
+ */
+TEST_F(hidraw, ioctl_sinput)
+{
+	__u8 buf[10] = {0};
+	int err;
+
+	/* prepare input report data */
+	buf[0] = 1; /* report ID */
+	buf[1] = 0x55;
+	buf[2] = 0xAA;
+
+	/* set input report */
+	err = ioctl(self->hidraw_fd, HIDIOCSINPUT(3), buf);
+	ASSERT_EQ(err, 3) TH_LOG("HIDIOCSINPUT ioctl failed, got %d", err);
+
+	/*
+	 * Note: The uhid mock doesn't validate the set report data,
+	 * so we just verify the ioctl succeeds
+	 */
+}
+
+/*
+ * Test HIDIOCGOUTPUT ioctl to get output report
+ */
+TEST_F(hidraw, ioctl_goutput)
+{
+	__u8 buf[10] = {0};
+	int err;
+
+	/* set report ID 1 in first byte */
+	buf[0] = 1;
+
+	/* get output report */
+	err = ioctl(self->hidraw_fd, HIDIOCGOUTPUT(sizeof(buf)), buf);
+	ASSERT_EQ(err, sizeof(feature_data)) TH_LOG("HIDIOCGOUTPUT ioctl failed, got %d", err);
+
+	/* verify we got the expected output data */
+	ASSERT_EQ(buf[0], feature_data[0])
+		TH_LOG("expected feature_data[0] = %d, got %d", feature_data[0], buf[0]);
+	ASSERT_EQ(buf[1], feature_data[1])
+		TH_LOG("expected feature_data[1] = %d, got %d", feature_data[1], buf[1]);
+}
+
+/*
+ * Test HIDIOCGOUTPUT ioctl with invalid report ID
+ */
+TEST_F(hidraw, ioctl_goutput_invalid)
+{
+	__u8 buf[10] = {0};
+	int err;
+
+	/* set invalid report ID (not 1) */
+	buf[0] = 2;
+
+	/* try to get output report */
+	err = ioctl(self->hidraw_fd, HIDIOCGOUTPUT(sizeof(buf)), buf);
+	ASSERT_LT(err, 0) TH_LOG("HIDIOCGOUTPUT should have failed with invalid report ID");
+	ASSERT_EQ(errno, EIO) TH_LOG("expected EIO, got errno %d", errno);
+}
+
+/*
+ * Test HIDIOCSOUTPUT ioctl to set output report
+ */
+TEST_F(hidraw, ioctl_soutput)
+{
+	__u8 buf[10] = {0};
+	int err;
+
+	/* prepare output report data */
+	buf[0] = 1; /* report ID */
+	buf[1] = 0x33;
+	buf[2] = 0xCC;
+
+	/* set output report */
+	err = ioctl(self->hidraw_fd, HIDIOCSOUTPUT(3), buf);
+	ASSERT_EQ(err, 3) TH_LOG("HIDIOCSOUTPUT ioctl failed, got %d", err);
+
+	/*
+	 * Note: The uhid mock doesn't validate the set report data,
+	 * so we just verify the ioctl succeeds
+	 */
+}
+
+/*
+ * Test HIDIOCGRAWNAME ioctl to get device name string
+ */
+TEST_F(hidraw, ioctl_rawname)
+{
+	char name[256] = {0};
+	char expected_name[64];
+	int err;
+
+	/* get device name */
+	err = ioctl(self->hidraw_fd, HIDIOCGRAWNAME(sizeof(name)), name);
+	ASSERT_GT(err, 0) TH_LOG("HIDIOCGRAWNAME ioctl failed, got %d", err);
+
+	/* construct expected name based on device id */
+	snprintf(expected_name, sizeof(expected_name), "test-uhid-device-%d", self->hid.dev_id);
+
+	/* verify the name matches expected pattern */
+	ASSERT_EQ(strcmp(name, expected_name), 0)
+		TH_LOG("expected name '%s', got '%s'", expected_name, name);
+}
+
+/*
+ * Test HIDIOCGRAWPHYS ioctl to get device physical address string
+ */
+TEST_F(hidraw, ioctl_rawphys)
+{
+	char phys[256] = {0};
+	char expected_phys[64];
+	int err;
+
+	/* get device physical address */
+	err = ioctl(self->hidraw_fd, HIDIOCGRAWPHYS(sizeof(phys)), phys);
+	ASSERT_GT(err, 0) TH_LOG("HIDIOCGRAWPHYS ioctl failed, got %d", err);
+
+	/* construct expected phys based on device id */
+	snprintf(expected_phys, sizeof(expected_phys), "%d", self->hid.dev_id);
+
+	/* verify the phys matches expected value */
+	ASSERT_EQ(strcmp(phys, expected_phys), 0)
+		TH_LOG("expected phys '%s', got '%s'", expected_phys, phys);
+}
+
+/*
+ * Test HIDIOCGRAWUNIQ ioctl to get device unique identifier string
+ */
+TEST_F(hidraw, ioctl_rawuniq)
+{
+	char uniq[256] = {0};
+	int err;
+
+	/* get device unique identifier */
+	err = ioctl(self->hidraw_fd, HIDIOCGRAWUNIQ(sizeof(uniq)), uniq);
+	ASSERT_GE(err, 0) TH_LOG("HIDIOCGRAWUNIQ ioctl failed, got %d", err);
+
+	/* uniq is typically empty in our test setup */
+	ASSERT_EQ(strlen(uniq), 0) TH_LOG("expected empty uniq, got '%s'", uniq);
+}
+
+/*
+ * Test device string ioctls with small buffer sizes
+ */
+TEST_F(hidraw, ioctl_strings_small_buffer)
+{
+	char small_buf[8] = {0};
+	char expected_name[64];
+	int err;
+
+	/* test HIDIOCGRAWNAME with small buffer */
+	err = ioctl(self->hidraw_fd, HIDIOCGRAWNAME(sizeof(small_buf)), small_buf);
+	ASSERT_EQ(err, sizeof(small_buf))
+		TH_LOG("HIDIOCGRAWNAME with small buffer failed, got %d", err);
+
+	/* construct expected truncated name */
+	snprintf(expected_name, sizeof(expected_name), "test-uhid-device-%d", self->hid.dev_id);
+
+	/* verify we got truncated name (first 8 chars, no null terminator guaranteed) */
+	ASSERT_EQ(strncmp(small_buf, expected_name, sizeof(small_buf)), 0)
+		TH_LOG("expected truncated name to match first %zu chars", sizeof(small_buf));
+
+	/* Note: hidraw driver doesn't guarantee null termination when buffer is too small */
+}
+
 int main(int argc, char **argv)
 {
 	return test_harness_run(argc, argv);
-- 
2.50.1


From 62cbd33ca66b578c3e1ec715cfa308ea48b4dc15 Mon Sep 17 00:00:00 2001
From: Benjamin Tissoires <bentiss@kernel.org>
Date: Thu, 21 Aug 2025 09:44:11 +0200
Subject: [PATCH 3/3] selftests/hid: hidraw: forge wrong ioctls and tests them

We also need coverage for when the malicious user is not using the
proper ioctls definitions and tries to work around the driver.

Suggested-by: Arnd Bergmann <arnd@kernel.org>
Co-developed-by: claude-4-sonnet
Signed-off-by: Benjamin Tissoires <bentiss@kernel.org>
---
 tools/testing/selftests/hid/hidraw.c | 61 ++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/tools/testing/selftests/hid/hidraw.c b/tools/testing/selftests/hid/hidraw.c
index 6d61d03e2ef0..2bbe0d69bd8a 100644
--- a/tools/testing/selftests/hid/hidraw.c
+++ b/tools/testing/selftests/hid/hidraw.c
@@ -332,6 +332,67 @@ TEST_F(hidraw, ioctl_gfeature_invalid)
 	ASSERT_EQ(errno, EIO) TH_LOG("expected EIO, got errno %d", errno);
 }
 
+/*
+ * Test HIDIOCGFEATURE ioctl with incorrect _IOC_DIR bits
+ * NOTE: This test currently fails because the driver does not validate _IOC_DIR
+ * bits for feature/input/output report ioctls. This should be fixed in the driver.
+ */
+TEST_F(hidraw, ioctl_gfeature_invalid_dir)
+{
+	__u8 buf[10] = {0};
+	int err;
+	unsigned int bad_cmd;
+
+	/* set report ID 1 in first byte */
+	buf[0] = 1;
+
+	/*
+	 * craft an ioctl command with wrong _IOC_DIR bits
+	 * HIDIOCGFEATURE should have _IOC_WRITE|_IOC_READ, let's use only _IOC_WRITE
+	 */
+	bad_cmd = _IOC(_IOC_WRITE, 'H', 0x07, sizeof(buf)); /* should be _IOC_WRITE|_IOC_READ */
+
+	/* try to get feature report with wrong direction bits */
+	err = ioctl(self->hidraw_fd, bad_cmd, buf);
+	ASSERT_LT(err, 0) TH_LOG("HIDIOCGFEATURE with wrong _IOC_DIR should have failed");
+	ASSERT_EQ(errno, EINVAL) TH_LOG("expected EINVAL for wrong _IOC_DIR, got errno %d", errno);
+
+	/* also test with only _IOC_READ */
+	bad_cmd = _IOC(_IOC_READ, 'H', 0x07, sizeof(buf)); /* should be _IOC_WRITE|_IOC_READ */
+
+	err = ioctl(self->hidraw_fd, bad_cmd, buf);
+	ASSERT_LT(err, 0) TH_LOG("HIDIOCGFEATURE with wrong _IOC_DIR should have failed");
+	ASSERT_EQ(errno, EINVAL) TH_LOG("expected EINVAL for wrong _IOC_DIR, got errno %d", errno);
+}
+
+/*
+ * Test read-only ioctl with incorrect _IOC_DIR bits
+ */
+TEST_F(hidraw, ioctl_readonly_invalid_dir)
+{
+	char buf[256] = {0};
+	int err;
+	unsigned int bad_cmd;
+
+	/*
+	 * craft an ioctl command with wrong _IOC_DIR bits
+	 * HIDIOCGRAWNAME should have _IOC_READ, let's use _IOC_WRITE
+	 */
+	bad_cmd = _IOC(_IOC_WRITE, 'H', 0x04, sizeof(buf)); /* should be _IOC_READ */
+
+	/* try to get device name with wrong direction bits */
+	err = ioctl(self->hidraw_fd, bad_cmd, buf);
+	ASSERT_LT(err, 0) TH_LOG("HIDIOCGRAWNAME with wrong _IOC_DIR should have failed");
+	ASSERT_EQ(errno, EINVAL) TH_LOG("expected EINVAL for wrong _IOC_DIR, got errno %d", errno);
+
+	/* also test with _IOC_WRITE|_IOC_READ */
+	bad_cmd = _IOC(_IOC_WRITE|_IOC_READ, 'H', 0x04, sizeof(buf)); /* should be only _IOC_READ */
+
+	err = ioctl(self->hidraw_fd, bad_cmd, buf);
+	ASSERT_LT(err, 0) TH_LOG("HIDIOCGRAWNAME with wrong _IOC_DIR should have failed");
+	ASSERT_EQ(errno, EINVAL) TH_LOG("expected EINVAL for wrong _IOC_DIR, got errno %d", errno);
+}
+
 /*
  * Test HIDIOCSFEATURE ioctl to set feature report
  */
-- 
2.50.1

---

Cheers,
Benjamin

