Return-Path: <linux-input+bounces-8169-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 745309D3ACD
	for <lists+linux-input@lfdr.de>; Wed, 20 Nov 2024 13:39:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35BB32835D9
	for <lists+linux-input@lfdr.de>; Wed, 20 Nov 2024 12:39:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82A831A3BAD;
	Wed, 20 Nov 2024 12:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eR2CqMgB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="of2M/yvE";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eR2CqMgB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="of2M/yvE"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C106C19F432;
	Wed, 20 Nov 2024 12:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732106363; cv=none; b=WRXcVBTbJkg1plU/h19myJlXptyoYcOgRo60bssGzc+hdv0MaVKfcIix9pF/fsUvJpCte4kIgDTGDBOTjQk328Tu31Gxw/Vf1mk9GVG+EDT73wWwR3d8d5dk576KWAdEaq9x9EvsK5KqXXcAVLOSc02uXNl3ch6Qm2UGw6gSLRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732106363; c=relaxed/simple;
	bh=xeMGb/D8nMTzxROFUPSvZVlLdK0LsDnTnJEJvQ1csGU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EVcdyUpbaAgcgyAFLEGeIhEr+5RDr3a6IGjYQQMVAhSMs6mx+IH69szDm/sxn/Ir/S4M3jd2OJhFRlZy3oLRt2mLUeJioFLa6Gg5BbkYYdiOlx7G8rB8gtAwUHBSuLVUH6dVQ677DTbTYWM2ue7ywhjGAesMS4o/55dTnJT0dts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=eR2CqMgB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=of2M/yvE; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=eR2CqMgB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=of2M/yvE; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B699C1F79C;
	Wed, 20 Nov 2024 12:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732106359; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W9mjT+B4JZ4+Oh+HgNPt0ag3rPOFwQMa/YzT5RYsfR0=;
	b=eR2CqMgBNGl/bKJfd7HouvsQwoRxGNwAqy9gCUBd6xsOcpw5OMGj6VXBB1CUauN+tPS8zz
	xFzqOL8l0eaSo5iqNd66Gnm3WvBZElDIMG/qdRFw1DCwUgvb1u6fZFZt0FipDg8leDUaGm
	ijLL0SKVM4DQbMpd2yMfjv33Wsr0djA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732106359;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W9mjT+B4JZ4+Oh+HgNPt0ag3rPOFwQMa/YzT5RYsfR0=;
	b=of2M/yvEMK2Wr7x3kdbx3f6KbzE/uCBZDOBIbETizV/JP9Ez+F8obkmFCgHNhqhYfNcwFb
	2UIJuAdLjcSoAHBQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=eR2CqMgB;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="of2M/yvE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732106359; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W9mjT+B4JZ4+Oh+HgNPt0ag3rPOFwQMa/YzT5RYsfR0=;
	b=eR2CqMgBNGl/bKJfd7HouvsQwoRxGNwAqy9gCUBd6xsOcpw5OMGj6VXBB1CUauN+tPS8zz
	xFzqOL8l0eaSo5iqNd66Gnm3WvBZElDIMG/qdRFw1DCwUgvb1u6fZFZt0FipDg8leDUaGm
	ijLL0SKVM4DQbMpd2yMfjv33Wsr0djA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732106359;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W9mjT+B4JZ4+Oh+HgNPt0ag3rPOFwQMa/YzT5RYsfR0=;
	b=of2M/yvEMK2Wr7x3kdbx3f6KbzE/uCBZDOBIbETizV/JP9Ez+F8obkmFCgHNhqhYfNcwFb
	2UIJuAdLjcSoAHBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 78427137CF;
	Wed, 20 Nov 2024 12:39:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kszVHHfYPWc/EAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 20 Nov 2024 12:39:19 +0000
Date: Wed, 20 Nov 2024 13:39:19 +0100
Message-ID: <875xoi3wqw.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Greg KH <gregkh@linuxfoundation.org>,
	<srinivas.kandagatla@linaro.org>,
	<mathias.nyman@intel.com>,
	<perex@perex.cz>,
	<conor+dt@kernel.org>,
	<dmitry.torokhov@gmail.com>,
	<corbet@lwn.net>,
	<broonie@kernel.org>,
	<lgirdwood@gmail.com>,
	<krzk+dt@kernel.org>,
	<pierre-louis.bossart@linux.dev>,
	<Thinh.Nguyen@synopsys.com>,
	<tiwai@suse.com>,
	<robh@kernel.org>,
	<linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>,
	<linux-sound@vger.kernel.org>,
	<linux-usb@vger.kernel.org>,
	<linux-input@vger.kernel.org>,
	<linux-arm-msm@vger.kernel.org>,
	<linux-doc@vger.kernel.org>
Subject: Re: [PATCH v30 00/30] Introduce QC USB SND audio offloading support
In-Reply-To: <2f512d8d-e5f3-4bdd-8172-37114a382a69@quicinc.com>
References: <20241106193413.1730413-1-quic_wcheng@quicinc.com>
	<edfeb642-297e-42bb-ad09-cbf74f995514@quicinc.com>
	<2024111655-approve-throwback-e7df@gregkh>
	<2f512d8d-e5f3-4bdd-8172-37114a382a69@quicinc.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B699C1F79C
X-Spam-Level: 
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[linuxfoundation.org,linaro.org,intel.com,perex.cz,kernel.org,gmail.com,lwn.net,linux.dev,synopsys.com,suse.com,vger.kernel.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -2.01
X-Spam-Flag: NO

On Tue, 19 Nov 2024 18:50:52 +0100,
Wesley Cheng wrote:
> 
> 
> On 11/15/2024 11:42 PM, Greg KH wrote:
> > On Fri, Nov 15, 2024 at 02:42:47PM -0800, Wesley Cheng wrote:
> >> Hi,
> >>
> >> On 11/6/2024 11:33 AM, Wesley Cheng wrote:
> >>> Requesting to see if we can get some Acked-By tags, and merge on usb-next.
> >> Are there any more clarifications that I can help with to get this
> >> series going?  I know its been a long time coming, so folks may have
> >> lost context, but if there are any points that might be blocking the
> >> series from getting merged, please let me know.
> > I would like others to review this (xhci maintainer for one), to give
> > their blessing before I even consider this.
> 
> Thanks, Greg...Yes, I was hoping to see if I could clarify any points for Mathias and Takashi if they had any concerns.  Just so folks are also aware, we did deploy a portion of the series (specifically the XHCI sec interrupter and USB SND core changes) into devices on the market, if that adds any confidence into those changes.  For the most part, there were no major issues within those drivers, and the single minor bug (in the XHCI sec intr) that we did catch was fixed in previous submissions, and should be highlighted in the change revision list.

Well, from the sound subsystem side, the only concerns are the design
issues: namely, whether the implementations with two cards are
acceptable, and whether the current control of PCM mapping is OK from
the user POV.  IIRC, there were discussions with Intel people and
others, and I haven't followed whether we got consensus.
If we reached some agreement, it'd be appreciated if you can put acks
from them in the patches, too.

The internal implementation details can be adjusted later, but those
two must be set in stone after merging the stuff to the upstream.

(BTW, the mail address of Pierre changed; I corrected in this mail.)


thanks,

Takashi

