Return-Path: <linux-input+bounces-16440-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 30EFEC9AA83
	for <lists+linux-input@lfdr.de>; Tue, 02 Dec 2025 09:22:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 136354E102D
	for <lists+linux-input@lfdr.de>; Tue,  2 Dec 2025 08:22:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 233413019B4;
	Tue,  2 Dec 2025 08:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FDNy29rh"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED91421FF35;
	Tue,  2 Dec 2025 08:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764663735; cv=none; b=HrD/BHg143jLDNnOLFhsoyW856JllVDr4XFAYgWRot1KtXQMok+qVK2F13txiX9ya/SA+TgZpHrhj18/J0sZlC40DCJGL+xldG8+RsNqd9p2nrfQhFyFnUDWrmKUF4tzVMhhfgkkmhqOGk56Vn2h8b8bSfAcKvwIszdaQHk8xOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764663735; c=relaxed/simple;
	bh=SR/+5Db0e39k7myOTUUgwrk0RQLOFXPhIDzBtSj/zIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EsFPKuXN0+D+5D7Si2HahVpnLW2Z6dj/Db2Iar2BQ2SjHqeZnMQIAf+WfFcsrT0dA2d9ZNw6S1RkEqawSf9IIEISBzdfhlWdySIwMMQ8WLJ2TBred9lCXGkQj1M4/srTjYEGthfdHG67SzbNGvhVH1jnpuaN72fuc7jH5qpNh4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FDNy29rh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CC91C4CEF1;
	Tue,  2 Dec 2025 08:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764663734;
	bh=SR/+5Db0e39k7myOTUUgwrk0RQLOFXPhIDzBtSj/zIk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FDNy29rhkm4REzLIPfO8JXp1wa7IT5ydvnhomttGb0dedidj4peQrCarme8COYVx9
	 sqyMRMVxmL0i/HhmtzPL4pcacFTgMg0dj/+I81D2j+JyEgXspFklFUroLNBOGPwb7x
	 /0CAXY1YauupnijVS7p/aGFWCn3v5oF9/cS3uXJ6z+kJyKWMAzrscIZWFGNDxnhoDN
	 hAj++/xPQXpkSAY9dmBfGCtlKjDdzRTsYampY3yUtZWOH7LewWuhLnUo4WNx351ilN
	 1xU9H5T0owmaLBgpNGyYzL5czBex8D6hrLYsAdc33/+3WMyoGR097a7+scK+Z2957d
	 iOgw133yfccxw==
Date: Tue, 2 Dec 2025 09:22:10 +0100
From: Benjamin Tissoires <bentiss@kernel.org>
To: Davide Beatrici <me@davidebeatrici.dev>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	jikos@kernel.org, benjamin.tissoires@redhat.com
Subject: Re: [PATCH] HID: validate report length and constants
Message-ID: <xyh6scqrfzft3hhmqowyverzezb2xsmsexegk3sydyfbiknba4@6sy3qbtsinrr>
References: <235531f556c5abfcae254a4e56441ba6@davidebeatrici.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <235531f556c5abfcae254a4e56441ba6@davidebeatrici.dev>

On Dec 02 2025, Davide Beatrici wrote:
> From 4956d80ba2bcdb0f5410dfe9365331bcece781cb Mon Sep 17 00:00:00 2001
> From: Davide Beatrici <git@davidebeatrici.dev>
> Date: Tue, 2 Dec 2025 05:00:52 +0100
> Subject: [PATCH] HID: validate report length and constants
> MIME-Version: 1.0
> Content-Type: text/plain; charset=UTF-8
> Content-Transfer-Encoding: 8bit
> 
> The HID specification defines Input(Constant) fields as padding or reserved
> bits that must remain zero at runtime. Currently, Linux accepts non‑zero
> values in these fields, allowing malformed reports to propagate to
> userspace.

Yep, this is on purpose because Miscrosoft's own driver works that way
and many HID devices do not bother to mark the non constant bits as
data. So if you enforce the spec here, you'll break a numerous of
devices unfortunatelly.

> 
> The ATK X1 SE (373b:1107) is a popular USB mouse that triggers weird
> behavior.
> A few seconds after connecting it sends a packet that is detected as
> malformed
> by WireShark, but the kernel happily accepts and parses it.

Can you show us what packets are emitted?

If it's a firmware bug, we better have a specific driver for it could
be a HID-BPF program that just filters out the unwanted reports.

Also, how does Windows behave with this mouse? Does it need a special
driver?

> 
> Until the device is disconnected, modifier keys are forced into a fixed
> state:
> 
> LeftControl (0xe0): UP
> LeftShift (0xe1): UP
> LeftAlt (0xe2): DOWN
> LeftGUI (0xe3): UP
> RightControl (0xe4): UP
> RightShift (0xe5): DOWN
> RightAlt (0xe6): DOWN
> RightGUI (0xe7): UP
> 
> And unknown keys are kept pressed:
> 
> kernel: usb 5-1: Unknown key (scancode 0xb2) pressed.
> kernel: usb 5-1: Unknown key (scancode 0xff) pressed.
> kernel: usb 5-1: Unknown key (scancode 0xff) pressed.
> 
> kernel: usb 5-1: Unknown key (scancode 0xc0) pressed.
> kernel: usb 5-1: Unknown key (scancode 0xb6) pressed.
> kernel: usb 5-1: Unknown key (scancode 0xff) pressed.
> kernel: usb 5-1: Unknown key (scancode 0xff) pressed.

Looks like there is something wrong either in the report descriptor of
this mouse, either in the emitted reports.

> 
> This patch extends hid-core to record Constant slices during descriptor
> parsing and validate them at runtime. Reports with non‑zero Constant bits
> are
> rejected, and a ratelimited warning is logged. Legitimate Data/Relative
> fields
> (buttons, motion axes, wheel) continue to pass through unchanged.

Ouch. If I read you correctly, you are rejecting the entire report if a
constant field is not 0. It is common for constant fields to be just
garbage (whatever is in the memory, because writing firmware is hard),
so even if we were to accept this patch, this would break even more
devices :(

> 
> Malformed reports are suppressed and no longer show up with
> usbmon/WireShark.
> All other USB devices I own still work flawlessly after applying this patch,
> but this is definitely something that requires extensive testing!

I am pretty sure the HID selftests will fail with this patch applied,
because there are probably a couple of devices there with the "non
constant" behaviour.

Cheers,
Benjamin

> 
> Signed-off-by: Davide Beatrici <git@davidebeatrici.dev>
> ---
>  drivers/hid/hid-core.c | 134 ++++++++++++++++++++++++++++++++++++++++-
>  include/linux/hid.h    |  15 +++++
>  2 files changed, 146 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
> index a5b3a8ca2fcb..bb45c5f6f4fb 100644
> --- a/drivers/hid/hid-core.c
> +++ b/drivers/hid/hid-core.c
> @@ -280,6 +280,81 @@ static int hid_add_usage(struct hid_parser *parser,
> unsigned usage, u8 size)
>  	return 0;
>  }
> 
> +/*
> + * Append metadata for runtime payload validation.
> + */
> +
> +static int hid_validate_append_bits(struct hid_report *r, const __u16
> bit_off, const __u16 bit_len)
> +{
> +	struct hid_report_validate *v = &r->validate;
> +	struct hid_const_slice *slices = krealloc(v->const_slices,
> +		(v->const_count + 1) * sizeof(*slices), GFP_KERNEL);
> +	if (!slices)
> +		return -ENOMEM;
> +
> +	v->const_slices = slices;
> +	v->const_slices[v->const_count].bit_off = bit_off;
> +	v->const_slices[v->const_count].bit_len = bit_len;
> +	v->const_count++;
> +
> +	return 0;
> +}
> +
> +/*
> + * Validate runtime payload.
> + */
> +
> +static bool hid_validate_report(struct hid_device *hid, struct hid_report
> *r,
> +		const __u8 *buf, size_t len)
> +{
> +	const __u8 *payload;
> +	size_t payload_len;
> +	__u16 i;
> +
> +	/* Report ID handling: if present, buf[0] is ID; payload follows */
> +	payload = r->id ? buf + 1 : buf;
> +	payload_len = r->id ? (len ? len - 1 : 0) : len;
> +
> +	if (r->validate.payload_len && payload_len != r->validate.payload_len) {
> +		hid_warn_ratelimited(hid,
> +			"Malformed report: length %zu != expected %u (ID %u)\n",
> +			payload_len, r->validate.payload_len, r->id);
> +		return false;
> +	}
> +
> +	for (i = 0; i < r->validate.const_count; i++) {
> +		const __u16 bit_off = r->validate.const_slices[i].bit_off;
> +		const __u16 bit_len = r->validate.const_slices[i].bit_len;
> +		const __u16 end_bit = bit_off + bit_len;
> +
> +		for (__u16 b = bit_off; b < end_bit;) {
> +			size_t byte_off = b >> 3;
> +			size_t bit_in_byte = b & 7;
> +
> +			__u16 rem_bits = end_bit - b;
> +			__u8 span = (__u8)min_t(__u16, rem_bits, 8 - bit_in_byte);
> +			__u8 mask = ((1u << span) - 1) << bit_in_byte;
> +
> +			if (byte_off >= payload_len) {
> +				hid_warn_ratelimited(hid,
> +					"Malformed report: const slice OOB (bit_off %u, len %u)\n",
> +					bit_off, bit_len);
> +				return false;
> +			}
> +			if (payload[byte_off] & mask) {
> +				hid_warn_ratelimited(hid,
> +					"Malformed report: non-zero constant at byte %zu mask 0x%02x val
> 0x%02x\n",
> +					byte_off, mask, payload[byte_off]);
> +				return false;
> +			}
> +
> +			b += span;
> +		}
> +	}
> +
> +	return true;
> +}
> +
>  /*
>   * Register a new field for this report.
>   */
> @@ -303,6 +378,8 @@ static int hid_add_field(struct hid_parser *parser,
> unsigned report_type, unsign
>  		return -1;
>  	}
> 
> +	parser->curr_report = report;
> +
>  	/* Handle both signed and unsigned cases properly */
>  	if ((parser->global.logical_minimum < 0 &&
>  		parser->global.logical_maximum <
> @@ -638,11 +715,13 @@ static void hid_concatenate_last_usage_page(struct
> hid_parser *parser)
>  static int hid_parser_main(struct hid_parser *parser, struct hid_item
> *item)
>  {
>  	__u32 data;
> +	__u8 flags;
>  	int ret;
> 
>  	hid_concatenate_last_usage_page(parser);
> 
>  	data = item_udata(item);
> +	flags = (u8)data;
> 
>  	switch (item->tag) {
>  	case HID_MAIN_ITEM_TAG_BEGIN_COLLECTION:
> @@ -651,15 +730,61 @@ static int hid_parser_main(struct hid_parser *parser,
> struct hid_item *item)
>  	case HID_MAIN_ITEM_TAG_END_COLLECTION:
>  		ret = close_collection(parser);
>  		break;
> -	case HID_MAIN_ITEM_TAG_INPUT:
> +	case HID_MAIN_ITEM_TAG_INPUT: {
> +		__u16 offset_bits, size_bits;
> +
> +		if (flags & HID_MAIN_ITEM_RESERVED_MASK) {
> +			hid_warn_ratelimited(parser->device,
> +				"Malformed input descriptor: reserved bits set (0x%02x)\n",
> +				flags);
> +			return -EINVAL;
> +		}
> +
> +		/* Compute field range in bits */
> +		offset_bits = parser->curr_offset;
> +		size_bits   = parser->global.report_size * parser->global.report_count;
> +
> +		/* Record Input(Constant) slices for runtime validation */
> +		if ((flags & HID_MAIN_ITEM_CONSTANT) && parser->curr_report) {
> +			/* Record bit-granular slice: store bit offset and size */
> +			ret = hid_validate_append_bits(parser->curr_report, offset_bits,
> size_bits);
> +			if (ret)
> +				return ret;
> +		}
> +
> +		/* Advance offset and add field */
> +		parser->curr_offset += size_bits;
> +
>  		ret = hid_add_field(parser, HID_INPUT_REPORT, data);
> +		if (!ret && parser->curr_report) {
> +			/* Expected payload length (bytes) excluding the optional ID */
> +			parser->curr_report->validate.payload_len = (parser->curr_report->size +
> 7) / 8;
> +		}
> +
>  		break;
> -	case HID_MAIN_ITEM_TAG_OUTPUT:
> +	}
> +	case HID_MAIN_ITEM_TAG_OUTPUT: {
> +		if (flags & HID_MAIN_ITEM_RESERVED_MASK) {
> +			hid_warn_ratelimited(parser->device,
> +				"Malformed output descriptor: reserved bits set (0x%02x)\n",
> +				flags);
> +			return -EINVAL;
> +		}
> +
>  		ret = hid_add_field(parser, HID_OUTPUT_REPORT, data);
>  		break;
> -	case HID_MAIN_ITEM_TAG_FEATURE:
> +	}
> +	case HID_MAIN_ITEM_TAG_FEATURE: {
> +		if (flags & HID_MAIN_ITEM_RESERVED_MASK) {
> +			hid_warn_ratelimited(parser->device,
> +				"Malformed feature descriptor: reserved bits set (0x%02x)\n",
> +				flags);
> +			return -EINVAL;
> +		}
> +
>  		ret = hid_add_field(parser, HID_FEATURE_REPORT, data);
>  		break;
> +	}
>  	default:
>  		if (item->tag >= HID_MAIN_ITEM_TAG_RESERVED_MIN &&
>  			item->tag <= HID_MAIN_ITEM_TAG_RESERVED_MAX)
> @@ -2062,6 +2187,9 @@ int hid_report_raw_event(struct hid_device *hid, enum
> hid_report_type type, u8 *
>  		memset(cdata + csize, 0, rsize - csize);
>  	}
> 
> +	if (!hid_validate_report(hid, report, data, size))
> +		goto out;
> +
>  	if ((hid->claimed & HID_CLAIMED_HIDDEV) && hid->hiddev_report_event)
>  		hid->hiddev_report_event(hid, report);
>  	if (hid->claimed & HID_CLAIMED_HIDRAW) {
> diff --git a/include/linux/hid.h b/include/linux/hid.h
> index a4ddb94e3ee5..3c7b3a8faa48 100644
> --- a/include/linux/hid.h
> +++ b/include/linux/hid.h
> @@ -88,6 +88,7 @@ struct hid_item {
>   * HID report descriptor main item contents
>   */
> 
> +#define HID_MAIN_ITEM_RESERVED_MASK	0x0c8 /* HID 1.11: flags reserved bits
> (3, 6, 7) must be zero */
>  #define HID_MAIN_ITEM_CONSTANT		0x001
>  #define HID_MAIN_ITEM_VARIABLE		0x002
>  #define HID_MAIN_ITEM_RELATIVE		0x004
> @@ -560,6 +561,17 @@ struct hid_field_entry {
>  	__s32 priority;
>  };
> 
> +struct hid_const_slice {
> +	__u16 bit_off;
> +	__u16 bit_len;
> +};
> +
> +struct hid_report_validate {
> +	struct hid_const_slice *const_slices;
> +	__u16 const_count;
> +	__u16 payload_len;
> +};
> +
>  struct hid_report {
>  	struct list_head list;
>  	struct list_head hidinput_list;
> @@ -576,6 +588,7 @@ struct hid_report {
>  	/* tool related state */
>  	bool tool_active;				/* whether the current tool is active */
>  	unsigned int tool;				/* BTN_TOOL_* */
> +	struct hid_report_validate validate;
>  };
> 
>  #define HID_MAX_IDS 256
> @@ -760,6 +773,8 @@ struct hid_parser {
>  	unsigned int          collection_stack_size;
>  	struct hid_device    *device;
>  	unsigned int          scan_flags;
> +	__u16                 curr_offset;
> +	struct hid_report    *curr_report;
>  };
> 
>  struct hid_class_descriptor {
> -- 
> 2.51.2
> 

