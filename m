Return-Path: <linux-input+bounces-5873-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BF995ED4E
	for <lists+linux-input@lfdr.de>; Mon, 26 Aug 2024 11:33:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13E94282AB6
	for <lists+linux-input@lfdr.de>; Mon, 26 Aug 2024 09:33:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74CFA146584;
	Mon, 26 Aug 2024 09:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d+EjeyBH"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892FC13D630;
	Mon, 26 Aug 2024 09:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724664792; cv=none; b=keHUoY0pMrmxdKFVhfO3Gp1B5gxiqGGDX17GHdOXZgHrJ4Z+FYJYZMu3ZXu5edyM1VLi3ZjMrTEpUhtWwzhzAWPisA1v7jUBbXgA0qwj5t/0+6PmF9LjB+hsMi5Jhwk8DlpsWj93K8THUsgQzej0TsdIHvT4R3NWxkKTwYb8IDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724664792; c=relaxed/simple;
	bh=5gF49ZsaBl+eyYEsQZFl8g7Ns5jOi2/2z9XqrrfRfmI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SV+uiTefO6odSYwMbjTztiBa59T5ZgIA/Mdc3TBrUKkNyvonjBnSXhxjYRIGfhQvt8kSCn9r1gAAvuexMPvWpx+UABoGGJQ7VSgktOKwJpbvAcW6aK3KHXKS/IKd2uOLyHV05mG7uLgebdLRqbZryjVPrOrmRLqrXmmWpU30QRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d+EjeyBH; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724664791; x=1756200791;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=5gF49ZsaBl+eyYEsQZFl8g7Ns5jOi2/2z9XqrrfRfmI=;
  b=d+EjeyBHlhkx1BjfdYbQsoXrglBjlBrZdwqR4WIFaK0oK9RzFyGJKaVV
   BAcPLfxqHTnmYVKKESGwvik+P69q+wIxjGUS3+YiJcO7SKHm8++jLqCU2
   ExCaswP+Qy+b1zSZ/79KCsgFI61CVcwA8CQNfikrzlHR5JiQKqzHy5hXw
   trynUIAvPxnr3hnQbhmqfZK8MD4tzz65v37E8zTgSU9rXdmoKPp46GYa7
   HdiA+rNYIAAfBQUIfubYgcr9IE8N0JpeI34uBRWkZsv+WNut8gc/tEG6p
   zKD1+wAo6bt49ngN4kGuE8f41o+SQEQ+J5/jZw2I64cmLEAkccWt9P6LO
   w==;
X-CSE-ConnectionGUID: uAbQSPB9RSW0VeQbYmKcPw==
X-CSE-MsgGUID: lnnUEWNvQRu7WcdIPA4ThA==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="25967099"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="25967099"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 02:33:10 -0700
X-CSE-ConnectionGUID: StgiaI9yQWW9P7hnhG707A==
X-CSE-MsgGUID: q0WWbT5FSWeCAnkmt419Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="62134701"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO [10.245.246.121]) ([10.245.246.121])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 02:33:03 -0700
Message-ID: <f4e609c0-92ff-4724-8243-bfe5de50d308@linux.intel.com>
Date: Mon, 26 Aug 2024 11:28:45 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v25 00/33] Introduce QC USB SND audio offloading support
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
 dmitry.torokhov@gmail.com, corbet@lwn.net, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, krzk+dt@kernel.org,
 Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com, robh@kernel.org,
 gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-doc@vger.kernel.org, alsa-devel@alsa-project.org
References: <20240823200101.26755-1-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240823200101.26755-1-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


> Changelog
> --------------------------------------------
> Changes in v25:
> - Cleanups on typos mentioned within the xHCI layers
> - Modified the xHCI interrupter search if clients specify interrupter index
> - Moved mixer_usb_offload into its own module, so that other vendor offload USB
> modules can utilize it also.
> - Added support for USB audio devices that may have multiple PCM streams, as
> previous implementation only assumed a single PCM device.  SOC USB will be
> able to handle an array of PCM indexes supported by the USB audio device.
> - Added some additional checks in the QC USB offload driver to check that device
> has at least one playback stream before allowing to bind
> - Reordered DT bindings to fix the error found by Rob's bot.  The patch that
> added USB_RX was after the example was updated.
> - Updated comments within SOC USB to clarify terminology and to keep it consistent
> - Added SND_USB_JACK type for notifying of USB device audio connections

I went through the code and didn't find anything that looked like a
major blocker. There are still a number of cosmetic things you'd want to
fix such as using checkpatch.pl --strict --codespell to look for obvious
style issues and typos, see selection below. git am also complains about
EOF lines.

Overall this is starting to look good and ready for other reviewers to
look at.



WARNING: 'reaquire' may be misspelled - perhaps 'reacquire'?
#54: FILE: drivers/usb/host/xhci-ring.c:3037:
+ * for non OS owned interrupter event ring. It may drop and reaquire
xhci->lock
                                                             ^^^^^^^^
WARNING: 'compliation' may be misspelled - perhaps 'compilation'?
#16:
module compliation added by Wesley Cheng to complete original concept code
       ^^^^^^^^^^^
CHECK: Prefer kzalloc(sizeof(*sgt)...) over kzalloc(sizeof(struct
sg_table)...)
#105: FILE: drivers/usb/host/xhci-sideband.c:35:
+	sgt = kzalloc(sizeof(struct sg_table), GFP_KERNEL);

CHECK: struct mutex definition without comment
#557: FILE: include/linux/usb/xhci-sideband.h:35:
+	struct mutex			mutex;

WARNING: 'straightfoward' may be misspelled - perhaps 'straightforward'?
#22:
straightfoward, as the ASoC components have direct references to the ASoC
^^^^^^^^^^^^^^
CHECK: Unnecessary parentheses around 'card == sdev->card_idx'
#142: FILE: sound/soc/qcom/qdsp6/q6usb.c:217:
+	if ((card == sdev->card_idx) &&
+		(pcm == sdev->ppcm_idx[sdev->num_playback - 1])) {

CHECK: Unnecessary parentheses around 'pcm ==
sdev->ppcm_idx[sdev->num_playback - 1]'
#142: FILE: sound/soc/qcom/qdsp6/q6usb.c:217:
+	if ((card == sdev->card_idx) &&
+		(pcm == sdev->ppcm_idx[sdev->num_playback - 1])) {

WARNING: 'seqeunces' may be misspelled - perhaps 'sequences'?
#8:
seqeunces.  This allows for platform USB SND modules to properly initialize
^^^^^^^^^

WARNING: 'exisiting' may be misspelled - perhaps 'existing'?
#12:
exisiting parameters.
^^^^^^^^^

CHECK: Please use a blank line after function/struct/union/enum declarations
#1020: FILE: sound/usb/qcom/usb_audio_qmi_v01.h:98:
+};
+#define QMI_UAUDIO_STREAM_REQ_MSG_V01_MAX_MSG_LEN 46

CHECK: Please use a blank line after function/struct/union/enum declarations
#1054: FILE: sound/usb/qcom/usb_audio_qmi_v01.h:132:
+};
+#define QMI_UAUDIO_STREAM_RESP_MSG_V01_MAX_MSG_LEN 202

CHECK: Please use a blank line after function/struct/union/enum declarations
#1081: FILE: sound/usb/qcom/usb_audio_qmi_v01.h:159:
+};
+#define QMI_UAUDIO_STREAM_IND_MSG_V01_MAX_MSG_LEN 181

CHECK: Macro argument 'n' may be better as '(n)' to avoid precedence issues
#100: FILE: sound/usb/mixer_usb_offload.c:19:
+#define PCM_IDX(n)  (n & 0xffff)

CHECK: Macro argument 'n' may be better as '(n)' to avoid precedence issues
#101: FILE: sound/usb/mixer_usb_offload.c:20:
+#define CARD_IDX(n) (n >> 16)


